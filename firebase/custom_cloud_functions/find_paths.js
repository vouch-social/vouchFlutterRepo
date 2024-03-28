const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
exports.findPaths = functions.https.onCall(async (data) => {
  const phone1 = data.phone1;
  const phone2 = data.phone2;
  const session = driver.session();
  try {
    const query = `
    MATCH (source:kontakt {phone: '${phone1}'}),
    (target:kontakt {phone: '${phone2}'})
    CALL gds.shortestPath.yens.stream('kontaktGraph', {
        sourceNode: source,
        targetNode: target,
        k: 3,
        relationshipWeightProperty: 'strength'
    })
    YIELD index, sourceNode, targetNode, totalCost, nodeIds, costs, path
    RETURN
    source,target,
        index,
        gds.util.asNode(sourceNode).phone AS sourceNodePhone,
        gds.util.asNode(targetNode).phone AS targetNodePhone,
        totalCost,
        [nodeId IN nodeIds | gds.util.asNode(nodeId).phone] AS nodePhones,
        costs,
        nodes(path) as path
    `;
    const result = await session.run(query);
    const formattedResult = result.records.map((record) => {
      const nodePhones = record.get("nodePhones");
      const costs = record.get("costs");
      const pathDetails = [];
      for (let i = 0; i < nodePhones.length; i++) {
        pathDetails.push({
          phone: nodePhones[i],
          cost: i > 0 ? costs[i - 1] : 0,
        });
      }
      return {
        sourceNodePhone: record.get("sourceNodePhone"),
        targetNodePhone: record.get("targetNodePhone"),
        totalCost: record.get("totalCost"),
        pathDetails: pathDetails,
      };
    });
    return { data: formattedResult };
  } catch (error) {
    console.error("Error running query:", error);
    // Return an error response
    return { status: "error", message: error.message };
  } finally {
    await session.close();
  }
});

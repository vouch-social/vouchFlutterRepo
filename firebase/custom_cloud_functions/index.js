const admin = require("firebase-admin/app");
admin.initializeApp();

const newCloudFunction2 = require("./new_cloud_function2.js");
exports.newCloudFunction2 = newCloudFunction2.newCloudFunction2;
const findPaths = require("./find_paths.js");
exports.findPaths = findPaths.findPaths;

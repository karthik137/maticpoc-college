
/**
 * 
 * @param {*} db 
 * @param {*} document 
 * @param {*} collection 
 */
exports.insertDocument = (db, document, collection) => {
    const coll = db.collection(collection);
    return coll.insertOne(document);
};

/**
 * 
 * @param {*} db 
 * @param {*} collection 
 */
exports.findDocuments = (db, collection) => {
    const coll = db.collection(collection);
    return coll.find({}).toArray();
};
 
/**
 * @param {*} db
 * @param {*} collection
 * @param {*} query
 */
exports.findDocumentsByQuery = (db, collection, query) => {
    const coll = db.collection(collection);
    return coll.find(query).toArray();
};

/**
 * 
 * @param {*} db 
 * @param {*} document 
 * @param {*} collection 
 */
exports.removeDocument = (db, document, collection) => {
    const coll = db.collection(collection);
    return coll.deleteOne(document);
};

/**
 * 
 * @param {*} db 
 * @param {*} document 
 * @param {*} update 
 * @param {*} collection 
 */
exports.updateDocument = (db, document, update, collection) => {
    const coll = db.collection(collection);
    return coll.updateOne(document, {
        $set: update
    }, null);
};

/**
 * @param {*} db
 * @param {*} collection
 */
exports.dropCollection = (db, collection) => {
    return db.dropCollection(collection);
};
module.exports = [
    {
        message: 'Create "NODE detail page - 1:1 Relationship" tickets for which node type? (e.g. "Car Model")',
        name: 'nodeType',
        type: 'input'
    }, {
        message: 'What is the node type of the relationship partner? (e.g. "Brand")',
        name: 'partnerNodeType',
        type: 'input',
    }, {
        message: 'What example name should be used for the start node in the tests? (e.g. "VW")',
        name: 'exampleName',
        type: 'input',
    }, {
        message: 'ID of the corresponding parent (epic) ticket? (e.g. "MCF-176")',
        name: 'epicId',
        type: 'input',
    },
]

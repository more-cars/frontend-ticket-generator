import fs from "node:fs"
import inquirer from 'inquirer'
import {convertToCliParameters} from "./lib/convertToCliParameters"
import {spawnShellCommand} from "./lib/spawnShellCommand"
import {createTickets} from "./lib/createTickets"
import {select} from "@inquirer/prompts"
import {dasherize} from "inflection"

prepareAndCreateTickets().then(() => true)

async function prepareAndCreateTickets() {
    const ticketTreePath = __dirname + '/_temp/ticketTree.json'
    if (fs.existsSync(ticketTreePath)) {
        fs.rmSync(ticketTreePath)
    }

    const feature = await promptFeature()
    const featureParameters = await promptFeatureParameters(feature)
    const nodeTypeProperties = getNodeTypeProperties(featureParameters['nodeType'])
    const cliParameters = convertToCliParameters(featureParameters)

    const hygenCommand = `HYGEN_OVERWRITE=1 HYGEN_TMPLS='${__dirname}' hygen features ${feature} ${cliParameters} --props='${JSON.stringify(nodeTypeProperties)}'`
    console.log(hygenCommand)
    await spawnShellCommand(hygenCommand)

    const data = JSON.parse(fs.readFileSync(ticketTreePath, 'utf8'))
    const createdTickets = await createTickets(data)
    console.log('Tickets created:', createdTickets)
}

async function promptFeature() {
    const choices = [
        {value: 'node-overview-page'},
        {value: 'node-detail-page'},
        {value: 'node-detail-page-lead-image'},
        {value: 'node-detail-page-1-to-n-relationship'},
        {value: 'node-detail-page-1-to-1-relationship'},
    ]

    return select({
        message: 'Generating tickets for which feature?',
        choices,
    })
}

async function promptFeatureParameters(feature: string) {
    const questions = require(`${__dirname}/features/${feature}/prompt.js`)

    return inquirer.prompt(questions)
}

function getNodeTypeProperties(nodeType: string) {
    return require(`./node-type-properties/${dasherize(nodeType.toLowerCase())}-properties.json`)
}

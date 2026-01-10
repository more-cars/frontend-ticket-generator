import fs from "node:fs"
import inquirer from 'inquirer'
import {select} from "@inquirer/prompts"
import {createTickets} from "./lib/createTickets"
import {convertToCliParameters} from "./lib/convertToCliParameters"
import {spawnShellCommand} from "./lib/spawnShellCommand"

prepareAndCreateTickets().then(() => true)

async function prepareAndCreateTickets() {
    const ticketTreePath = __dirname + '/_temp/ticketTree.json'
    if (fs.existsSync(ticketTreePath)) {
        fs.rmSync(ticketTreePath)
    }

    const feature = await promptFeature()
    const featureParameters = await promptFeatureParameters(feature)
    const cliParameters = convertToCliParameters(featureParameters)

    const hygenCommand = `HYGEN_OVERWRITE=1 HYGEN_TMPLS='${__dirname}' hygen features ${feature} ${cliParameters}`
    await spawnShellCommand(hygenCommand)

    const data = JSON.parse(fs.readFileSync(ticketTreePath, 'utf8'))
    const createdTickets = await createTickets(data)
    console.log('Tickets created:', createdTickets)
}

async function promptFeature() {
    const choices = [
        {value: 'node-overview-page'},
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

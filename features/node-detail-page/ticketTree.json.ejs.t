---
to: _temp/ticketTree.json
---
<% const properties = JSON.parse(props) -%>
{
    "epic": {
        "jiraId": "<%= h.changeCase.upper(h.changeCase.kebab(epicId)) %>",
        "dataStructure": null,
        "stories": [{
            "title": "<%= h.changeCase.upper(nodeType) %> detail page",
            "userStory": "As a visitor\nI want each <%= h.changeCase.upper(nodeType) %> to have a dedicated page\nSo I can find every piece of information about it in one place",
            "specificationList": [
                "Each <%= h.changeCase.upper(nodeType) %> has a dedicated detail page, with its own URL. -> Status Code `200`",
                "An error message is shown when there exists no <%= h.changeCase.upper(nodeType) %> with the given ID. -> Status Code `404`",
                "The detail page has a fact sheet. It contains all properties that are specified for the node type <%= h.changeCase.upper(nodeType) %>. -> See <%= h.changeCase.upper(h.changeCase.kebab(epicId)) %>",
                "Each property in the fact sheet is displayed as a key-value pair, with the property name and the property value.",
                "When a property has no value (null or undefined) it is still displayed in the fact sheet, but marked as empty.",
                "The name of the <%= h.changeCase.upper(nodeType) %> is reflected in the main headline and in the page title. The page title might contain additional text, like the suffix 'More Cars'. The main headline might also contain additional information to make generic nodes more unique.",
                "A representative image of the <%= h.changeCase.upper(nodeType) %> is displayed at a prominent location on the page."
            ],
            "apiPath": "/<%= h.changeCase.kebab(h.inflection.pluralize(nodeType)) %>",
            "responseOptions": [
                "200",
                "404"
            ],
            "acceptanceCriteria": [
                {
                    "title": "The name of the <%= h.changeCase.upper(nodeType) %> is exposed in all relevant locations",
                    "description": "The main headline and the page title contain the name of the <%= h.changeCase.upper(nodeType) %>. But the name does not occupy those locations exclusively. There might be other features that inject their information as a suffix or prefix.",
                    "responseCode": "200",
                    "tests": [
                        {
                            "title": "Expecting to see the name of the <%= h.changeCase.upper(nodeType) %> in all important locations on the detail page",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the detail page of a \\"' + h.changeCase.upper(nodeType) + '\\"')
                                gherkin.push('Then the page title should contain the \\"' + h.changeCase.upper(nodeType) + '\\" name')
                                gherkin.push('And the main headline should contain the \\"' + h.changeCase.upper(nodeType) + '\\" name')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "The detail page shows a representative image of the <%= h.changeCase.upper(nodeType) %>",
                    "description": "For the representative image the 'prime image' of the <%= h.changeCase.upper(nodeType) %> is used. When there is no 'prime image' then a fallback image is displayed. The image is displayed in a medium size. Medium means significantly larger than thumbnail size, but also significantly smaller than the screen size.",
                    "responseCode": "200",
                    "tests": [
                        {
                            "title": "Expecting a photo of the <%= h.changeCase.upper(nodeType) %> to be displayed on the detail page",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the detail page of a \\"' + h.changeCase.upper(nodeType) + '\\"')
                                gherkin.push('Then the page should contain a photo section')
                                gherkin.push('And the photo section should contain an image of the \\"' + h.changeCase.upper(nodeType) + '\\"')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }, {
                            "title": "Expecting the photo section to show a fallback image when the <%= h.changeCase.upper(nodeType) %> has no representative image",
                            <%
                                gherkin = []
                                gherkin.push('Given the \\"' + h.changeCase.upper(nodeType) + '\\" \\"' + exampleName + '\\" has no representative image')
                                gherkin.push('When the user visits the detail page of the \\"' + h.changeCase.upper(nodeType) + '\\" \\"' + exampleName + '\\"')
                                gherkin.push('Then the page should contain a photo section')
                                gherkin.push('And the photo section should contain a fallback image')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "A fact sheet with all <%= h.changeCase.upper(nodeType) %> properties is displayed",
                    "description": "Each property is presented as a key-value pair. Properties are not aggregated or combined. Properties without value are displayed, but marked as empty. Zero-values and null-values are visually distinct.",
                    "responseCode": "200",
                    "tests": [
                        {
                            "title": "Expecting the <%= h.changeCase.upper(nodeType) %> detail page to contain a populated fact sheet",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the detail page of a \\"' + h.changeCase.upper(nodeType) + '\\"')
                                gherkin.push('Then the page should display a fact sheet')
                                gherkin.push('And the fact sheet should display an entry for each of the following properties')
                                gherkin.push('  | _property_       |')
                                properties.forEach(prop => {
                                    gherkin.push('  | ' + prop.name + ' |')
                                })
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "An error message is displayed when the requested <%= h.changeCase.upper(nodeType) %> does not exist",
                    "description": "An info or warning is displayed at a prominent location. It should inform the user that there the requested <%= h.changeCase.upper(nodeType) %> does not exist or not anymore.",
                    "responseCode": "404",
                    "tests": [
                        {
                            "title": "Trying to access the detail page of a non-existent <%= h.changeCase.upper(nodeType) %>",
                            <%
                                gherkin = []
                                gherkin.push('Given there is no \\"' + h.changeCase.upper(nodeType) + '\\" \\"' + exampleName + '\\"')
                                gherkin.push('When the user visits the detail page of the \\"' + h.changeCase.upper(nodeType) + '\\" \\"' + exampleName + '\\"')
                                gherkin.push('Then the page should contain a message, informing the user that there is no such \\"' + h.changeCase.upper(nodeType) + '\\"')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }
            ]
        }]
    }
}

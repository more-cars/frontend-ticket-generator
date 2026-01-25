---
to: _temp/ticketTree.json
---
<% const properties = JSON.parse(props) -%>
{
    "epic": {
        "jiraId": "<%= h.changeCase.upper(h.changeCase.kebab(epicId)) %>",
        "dataStructure": null,
        "stories": [{
            "title": "<%= h.changeCase.upper(nodeType) %> detail page » <%= h.changeCase.upper(partnerNodeType) %>",
            "userStory": "As a visitor\nI want the <%= h.changeCase.upper(nodeType) %> detail page to show the connected <%= h.changeCase.upper(partnerNodeType) %>\nSo I can ...",
            "specificationList": [
                "The <%= h.changeCase.upper(nodeType) %> detail page is extended to contain a section for the connected <%= h.changeCase.upper(partnerNodeType) %>.",
                "The <%= h.changeCase.upper(partnerNodeType) %> is presented with its name and primary information.",
                "The <%= h.changeCase.upper(partnerNodeType) %> contains a link to its detail page.",
                "The <%= h.changeCase.upper(partnerNodeType) %> has a thumbnail image.",
                "When there is no <%= h.changeCase.upper(partnerNodeType) %> connected to the <%= h.changeCase.upper(nodeType) %> then the section is not displayed at all."
            ],
            "apiPath": "",
            "responseOptions": [
                "N/A"
            ],
            "acceptanceCriteria": [
                {
                    "title": "The <%= h.changeCase.upper(nodeType) %> detail page contains a section for the connected <%= h.changeCase.upper(partnerNodeType) %>",
                    "description": "In general, 1:1 relationships are more relevant for the end user than 1:n relationships. Therefore this <%= h.changeCase.upper(partnerNodeType) %> section is to be shown before the other relationship sections (e.g. the image gallery).",
                    "responseCode": "N/A",
                    "tests": [
                        {
                            "title": "Expecting a <%= h.changeCase.upper(partnerNodeType) %> section to be displayed on the <%= h.changeCase.upper(nodeType) %> detail page",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the detail page of a \\"' + h.changeCase.upper(nodeType) + '\\"')
                                gherkin.push('Then the page should contain a \\"' + h.changeCase.upper(partnerNodeType) + '\\" section')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "The <%= h.changeCase.upper(partnerNodeType) %> section is not displayed when there is no <%= h.changeCase.upper(partnerNodeType) %> connected",
                    "description": "There should be no section, no headline and no placeholder when the <%= h.changeCase.upper(nodeType) %> has no <%= h.changeCase.upper(partnerNodeType) %>.",
                    "responseCode": "N/A",
                    "tests": [
                        {
                            "title": "Expecting to see no <%= h.changeCase.upper(partnerNodeType) %> section when there is no <%= h.changeCase.upper(partnerNodeType) %> connected",
                            <%
                                gherkin = []
                                gherkin.push('Given there is a \\"' + h.changeCase.upper(nodeType) + '\\" \\"' + exampleName + '\\"')
                                gherkin.push('And the \\"' + h.changeCase.upper(nodeType) + '\\" \\"' + exampleName + '\\" has no relationships')
                                gherkin.push('When the user visits the detail page of the \\"' + h.changeCase.upper(nodeType) + '\\" \\"' + exampleName + '\\"')
                                gherkin.push('Then the page should contain no \\"' + h.changeCase.upper(partnerNodeType) + '\\" section')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "The <%= h.changeCase.upper(partnerNodeType) %> section contains a link to the detail page",
                    "description": "Only the title of the <%= h.changeCase.upper(partnerNodeType) %> should link to the detail page, not the whole section. Otherwise the user would not be able to select the text anymore.",
                    "responseCode": "N/A",
                    "tests": [
                        {
                            "title": "Expecting the <%= h.changeCase.upper(partnerNodeType) %> section to contain a link to the detail page",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the detail page of a \\"' + h.changeCase.upper(nodeType) + '\\"')
                                gherkin.push('Then the page should contain a \\"' + h.changeCase.upper(partnerNodeType) + '\\" section')
                                gherkin.push('And the \\"' + h.changeCase.upper(partnerNodeType) + '\\" section should contain a link to the detail page')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "The <%= h.changeCase.upper(partnerNodeType) %> section contains the node's primary information",
                    "description": "Each <%= h.changeCase.upper(partnerNodeType) %> has multiple properties. Some of them are categorized as 'primary information' to signal a higher importance. Only those should be shown in each list item. They are documented in the <%= h.changeCase.upper(partnerNodeType) %> epic (MCF-???).",
                    "responseCode": "N/A",
                    "tests": [
                        {
                            "title": "Expecting the <%= h.changeCase.upper(partnerNodeType) %> section to contain the node's primary information",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the detail page of a \\"' + h.changeCase.upper(nodeType) + '\\"')
                                gherkin.push('Then the page should contain a \\"' + h.changeCase.upper(partnerNodeType) + '\\" section')
                                gherkin.push('And the \\"' + h.changeCase.upper(partnerNodeType) + '\\" section should contain primary information')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "The <%= h.changeCase.upper(partnerNodeType) %> section contains a thumbnail image of the node",
                    "description": "The thumbnail shows the lead image of the resp. <%= h.changeCase.upper(partnerNodeType) %>. When it has no lead image then a generic fallback image is displayed. The image is loaded in a small resolution to keep the loading times short.",
                    "responseCode": "N/A",
                    "tests": [
                        {
                            "title": "Expecting the <%= h.changeCase.upper(partnerNodeType) %> section to contain a thumbnail image of the node",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the detail page of a \\"' + h.changeCase.upper(nodeType) + '\\"')
                                gherkin.push('Then the page should contain a \\"' + h.changeCase.upper(partnerNodeType) + '\\" section')
                                gherkin.push('Then the \\"' + h.changeCase.upper(partnerNodeType) + '\\" section should contain a thumbnail image')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }
            ]
        }]
    }
}

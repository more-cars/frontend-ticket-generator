---
to: _temp/ticketTree.json
---
<% const properties = JSON.parse(props) -%>
{
    "epic": {
        "jiraId": "<%= h.changeCase.upper(h.changeCase.kebab(epicId)) %>",
        "dataStructure": null,
        "stories": [{
            "title": "<%= h.changeCase.upper(nodeType) %> detail page » <%= h.changeCase.upper(h.inflection.pluralize(partnerNodeType)) %>",
            "userStory": "As a visitor\nI want the <%= h.changeCase.upper(nodeType) %> detail page to show all connected <%= h.changeCase.upper(h.inflection.pluralize(partnerNodeType)) %>\nSo I can ...",
            "specificationList": [
                "The detail page contains a section with a list of all connected <%= h.changeCase.upper(h.inflection.pluralize(partnerNodeType)) %>.",
                "Each <%= h.changeCase.upper(partnerNodeType) %> in the list is presented with its name and primary information.",
                "Each <%= h.changeCase.upper(partnerNodeType) %> in the list contains a link to its detail page.",
                "When there is no <%= h.changeCase.upper(partnerNodeType) %> connected to the <%= h.changeCase.upper(nodeType) %> then the section is not displayed at all."
            ],
            "apiPath": "",
            "responseOptions": [
                "N/A"
            ],
            "acceptanceCriteria": [
                {
                    "title": "The <%= h.changeCase.upper(nodeType) %> detail page contains a section with all connected <%= h.changeCase.upper(h.inflection.pluralize(partnerNodeType)) %>",
                    "description": "The <%= h.changeCase.upper(h.inflection.pluralize(partnerNodeType)) %> are classified as secondary information. Therefore the section has to be positioned after all the primary information (lead image, primary relationship, etc.). It is displayed in list form, analog to list on the overview page.",
                    "responseCode": "N/A",
                    "tests": [
                        {
                            "title": "Expecting a <%= h.changeCase.upper(partnerNodeType) %> section to be displayed on the <%= h.changeCase.upper(nodeType) %> detail page",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the detail page of a \\"' + h.changeCase.upper(nodeType) + '\\"')
                                gherkin.push('Then the page should contain a section with a \\"' + h.changeCase.upper(partnerNodeType) + '\\" list')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "The <%= h.changeCase.upper(partnerNodeType) %> section is not displayed when there are no <%= h.changeCase.upper(h.inflection.pluralize(partnerNodeType)) %> connected",
                    "description": "There should be no section, no headline and no placeholder when the <%= h.changeCase.upper(nodeType) %> has no <%= h.changeCase.upper(h.inflection.pluralize(partnerNodeType)) %>.",
                    "responseCode": "N/A",
                    "tests": [
                        {
                            "title": "Expecting to see no <%= h.changeCase.upper(partnerNodeType) %> section when there are no <%= h.changeCase.upper(h.inflection.pluralize(partnerNodeType)) %> connected",
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
                    "title": "Each <%= h.changeCase.upper(partnerNodeType) %> in the list contains a link to its detail page",
                    "description": "Only the title of each <%= h.changeCase.upper(partnerNodeType) %> should link to the respective detail page, not the whole list item. Otherwise the user would not be able to select the text anymore.",
                    "responseCode": "N/A",
                    "tests": [
                        {
                            "title": "Expecting each item in the <%= h.changeCase.upper(partnerNodeType) %> list to link to its detail page",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the detail page of a \\"' + h.changeCase.upper(nodeType) + '\\"')
                                gherkin.push('Then the page should contain a \\"' + h.changeCase.upper(partnerNodeType) + '\\" section')
                                gherkin.push('And each item in the \\"' + h.changeCase.upper(partnerNodeType) + '\\" list should link to its detail page')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "Each <%= h.changeCase.upper(partnerNodeType) %> in the list contains the primary information",
                    "description": "Each <%= h.changeCase.upper(partnerNodeType) %> has multiple properties. Some of them are categorized as 'primary information' to signal a higher importance. Only those should be shown in each list item. They are documented in the <%= h.changeCase.upper(partnerNodeType) %> epic (MCF-???).",
                    "responseCode": "N/A",
                    "tests": [
                        {
                            "title": "Expecting each item in the <%= h.changeCase.upper(partnerNodeType) %> list to contain its primary information",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the detail page of a \\"' + h.changeCase.upper(nodeType) + '\\"')
                                gherkin.push('Then the page should contain a \\"' + h.changeCase.upper(partnerNodeType) + '\\" section')
                                gherkin.push('And each item in the \\"' + h.changeCase.upper(partnerNodeType) + '\\" list should contain primary information')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }
            ]
        }]
    }
}

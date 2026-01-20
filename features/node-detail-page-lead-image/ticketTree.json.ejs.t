---
to: _temp/ticketTree.json
---
<% const properties = JSON.parse(props) -%>
{
    "epic": {
        "jiraId": "<%= h.changeCase.upper(h.changeCase.kebab(epicId)) %>",
        "dataStructure": null,
        "stories": [{
            "title": "<%= h.changeCase.upper(nodeType) %> detail page » Lead IMAGE",
            "userStory": "As a visitor\nI want the detail page to show a photo of the <%= h.changeCase.upper(nodeType) %>\nSo I can instantly see how it looks like\nOr to quickly verify that I am on the correct page",
            "specificationList": [
                "The detail page contains a section were the lead image of the <%= h.changeCase.upper(nodeType) %> is displayed.",
                "The image is displayed in a prominent location on the page.",
                "The image has a medium size. It is significantly larger than the thumbnail images, but also much smaller than the screen size (in desktop view).",
                "This lead image is provided by the API via the 'prime image' relationship.",
                "When the <%= h.changeCase.upper(nodeType) %> has no 'prime image' then a generic fallback image is displayed instead."
            ],
            "apiPath": "/<%= h.changeCase.kebab(h.inflection.pluralize(nodeType)) %>/<<%= h.changeCase.kebab(nodeType) %>-id>",
            "responseOptions": [
                "200"
            ],
            "acceptanceCriteria": [
                {
                    "title": "The detail page shows the lead image of the <%= h.changeCase.upper(nodeType) %>",
                    "description": "The lead image corresponds with the 'prime image' relationship in the API. When there is no 'prime image' then a fallback image is displayed. The image is displayed in a medium size. Medium means significantly larger than thumbnail size, but also significantly smaller than the screen size.",
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
                            "title": "Expecting the photo section to show a fallback image when the <%= h.changeCase.upper(nodeType) %> has no lead image",
                            <%
                                gherkin = []
                                gherkin.push('Given the \\"' + h.changeCase.upper(nodeType) + '\\" \\"' + exampleName + '\\" has no lead image')
                                gherkin.push('When the user visits the detail page of the \\"' + h.changeCase.upper(nodeType) + '\\" \\"' + exampleName + '\\"')
                                gherkin.push('Then the page should contain a photo section')
                                gherkin.push('And the photo section should contain a fallback image')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }
            ]
        }]
    }
}

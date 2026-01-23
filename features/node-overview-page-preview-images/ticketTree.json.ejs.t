---
to: _temp/ticketTree.json
---
{
    "epic": {
        "jiraId": "<%= h.changeCase.upper(h.changeCase.kebab(epicId)) %>",
        "dataStructure": null,
        "stories": [{
            "title": "<%= h.changeCase.upper(nodeType) %> overview page » Preview IMAGES",
            "userStory": "As a visitor\nI want to see a preview image for each <%= h.changeCase.upper(nodeType) %> on the overview page\nSo I can quickly find a specific one without knowing its name",
            "specificationList": [
                "each <%= h.changeCase.upper(nodeType) %> item on the <%= h.changeCase.upper(nodeType) %> overview page contains a preview image",
                "the 'preview image' refers to what is known as 'prime image' in the API",
                "the preview image is displayed in thumbnail size",
                "when a <%= h.changeCase.upper(nodeType) %> has no prime image then the preview image shows the default fallback image"
            ],
            "apiPath": "/<%= h.changeCase.kebab(h.inflection.pluralize(nodeType)) %>",
            "responseOptions": [
                "200"
            ],
            "acceptanceCriteria": [
                {
                    "title": "Each <%= h.changeCase.upper(nodeType) %> in the list contains a thumbnail image",
                    "description": "The thumbnail shows the main image of the resp. <%= h.changeCase.upper(nodeType) %>. When it has no main image then the generic fallback image is displayed. Each image is available in multiple sizes (resolutions). The one matching the screen size best should be used. Meaning, it should not be too small (bad quality) and not too big (slow download).",
                    "responseCode": "200",
                    "tests": [
                        {
                            "title": "Expecting a thumbnail image for each <%= h.changeCase.upper(nodeType) %> in the list",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                                gherkin.push('Then each item in the \\"' + h.changeCase.upper(nodeType) + '\\" list should contain a thumbnail image')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }
            ]
        }]
    }
}

---
to: _temp/ticketTree.json
---
{
    "epic": {
        "jiraId": "<%= h.changeCase.upper(h.changeCase.kebab(epicId)) %>",
        "dataStructure": null,
        "stories": [{
            "title": "<%= h.changeCase.upper(nodeType) %> overview page",
            "userStory": "As a visitor\nI want to see a list of all <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %>\nSo I can get a general idea of the different types that exist\nAnd by scrolling through them find interesting ones",
            "specificationList": [
                "There is a dedicated page (with a dedicated URL) where all <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> are presented.",
                "A warning message is shown when there are no <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %>.",
                "The overview page always returns with status code `200`, no matter if any <%= h.changeCase.upper(nodeType) %> exists or not.",
                "By default, the <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> are sorted `ascending` by their `name`.",
                "The sorting is always case-insensitive.",
                "Each <%= h.changeCase.upper(nodeType) %> is presented with its primary information and a link to its detail page.",
                "The overview displays at most 100 <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> at once.",
                "When there are more than 100 <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> then the `pagination` feature is activated.",
                "Pagination allows the user to scroll through all <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> - 100 items at a time.",
                "The user is able to bookmark and revisit any paginated <%= h.changeCase.upper(nodeType) %> page."
            ],
            "apiPath": "/<%= h.changeCase.kebab(h.inflection.pluralize(nodeType)) %>",
            "responseOptions": [
                "200"
            ],
            "acceptanceCriteria": [
                {
                    "title": "The overview page displays a list of all <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %>",
                    "description": "'All' does not necessarily mean that every single <%= h.changeCase.upper(nodeType) %> is displayed. Other features, like search, filtering or pagination might influence the displayed amount.",
                    "responseCode": "200",
                    "tests": [
                        {
                            "title": "Expecting the <%= h.changeCase.upper(nodeType) %> overview page to show a list of <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %>",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                                gherkin.push('Then the overview page should contain a \\"' + h.changeCase.upper(nodeType) + '\\" section')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "A warning is displayed when there are no <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %>",
                    "description": "The <%= h.changeCase.upper(nodeType) %> list is not shown and a info/warning is displayed at a prominent location. It should inform the user that there are either no <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> or that there is a temporary problem with loading the <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %>.",
                    "responseCode": "200",
                    "tests": [
                        {
                            "title": "Expecting a warning message when there exist no <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %>",
                            <%
                                gherkin = []
                                gherkin.push('Given there is no \\"' + h.changeCase.upper(nodeType) + '\\"')
                                gherkin.push('When the user visits the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                                gherkin.push('Then the page should contain no \\"' + h.changeCase.upper(nodeType) + '\\" section')
                                gherkin.push('And the page should contain a message, informing the user that there are no \\"' + h.changeCase.upper(nodeType) + '\\"s')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "Each <%= h.changeCase.upper(nodeType) %> in the list contains the primary information",
                    "description": "Each <%= h.changeCase.upper(nodeType) %> has a bunch of properties. Some of them are categorized as 'primary information' to signal a higher importance. Only those should be shown in the <%= h.changeCase.upper(nodeType) %> list. The corresponding epic <%= h.changeCase.upper(h.changeCase.kebab(epicId)) %> contains a list to find out which properties are 'primary'.",
                    "responseCode": "200",
                    "tests": [
                        {
                            "title": "Expecting each <%= h.changeCase.upper(nodeType) %> in the list to display its primary information",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                                gherkin.push('Then each item in the \\"' + h.changeCase.upper(nodeType) + '\\" list should contain primary information')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "Each <%= h.changeCase.upper(nodeType) %> in the list contains a link to the detail page",
                    "description": "Only the title of each <%= h.changeCase.upper(nodeType) %> should link to the respective detail page, not the whole <%= h.changeCase.upper(nodeType) %> list item. Otherwise the user would not be able to select the text anymore.",
                    "responseCode": "200",
                    "tests": [
                        {
                            "title": "Expecting each <%= h.changeCase.upper(nodeType) %> in the list to have a link to its detail page",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                                gherkin.push('Then each item in the \\"' + h.changeCase.upper(nodeType) + '\\" list should link to its detail page')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "By default, the <%= h.changeCase.upper(nodeType) %> list is sorted by name in ascending order",
                    "description": "Other features might influence the sorting, but by default all <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> in the list should be sorted by their 'name' property. The sorting should be case-insensitive, meaning '<%= h.changeCase.title(nodeType) %>', '<%= h.changeCase.lower(nodeType) %>' and '<%= h.changeCase.upper(nodeType) %>' should rank exactly the same.",
                    "responseCode": "200",
                    "tests": [
                        {
                            "title": "Expecting a sorted <%= h.changeCase.upper(nodeType) %> list when visiting the overview page",
                            <%
                                gherkin = []
                                gherkin.push('When the user visits the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                                gherkin.push('Then the \\"' + h.changeCase.upper(nodeType) + '\\" list should be sorted by \\"name\\" in \\"ascending\\" order')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "The maximum amount of <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> displayed on the overview page is limited",
                    "description": "To keep loading times and the page size reasonable there should be a limit on how many <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> are displayed at once. This limit should be configurable, but it only needs to be configurable in the code. It does not need to be configurable at run time. The limit should be 100. When there exist more <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> then the list on the overview page should be truncated. The pagination feature (different ticket) deals with the remaining <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> in such cases.",
                    "responseCode": "200",
                    "tests": [
                        {
                            "title": "Having more than 100 <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %>",
                            <%
                                gherkin = []
                                gherkin.push('Given there are 105 \\"' + h.changeCase.upper(nodeType) + '\\"s')
                                gherkin.push('When the user visits the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                                gherkin.push('Then the overview page should contain a \\"' + h.changeCase.upper(nodeType) + '\\" section')
                                gherkin.push('And the \\"' + h.changeCase.upper(nodeType) + '\\" list should contain 100 items')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }
                    ]
                }, {
                    "title": "The <%= h.changeCase.upper(nodeType) %> list gets paginated when the total <%= h.changeCase.upper(nodeType) %> count exceeds the predefined limit",
                    "description": "A pagination bar should be shown when the number of <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> is higher than the configured limit (specified in a different ticket). At a bare minimum it should contain a link to the next page (if available), a link to the previous page (if available) and indicate the current page number. When the number of <%= h.changeCase.upper(h.inflection.pluralize(nodeType)) %> is lower than the configured limit then the pagination bar should be hidden. Whatever technical solution is chosen, the user needs to be able to bookmark the different pages. Meaning all links need to be 'real' (it cannot be a pure JavaScript solution). Each page should display a different subset of the <%= h.changeCase.upper(nodeType) %> collection. There should be no overlap and there should be no <%= h.changeCase.upper(nodeType) %> missing.",
                    "responseCode": "200",
                    "tests": [
                        {
                            "title": "Expecting the pagination bar only to be visible when the <%= h.changeCase.upper(nodeType) %> list has more than 100 items",
                            <%
                                gherkin = []
                                gherkin.push('Given there are 100 \\"' + h.changeCase.upper(nodeType) + '\\"s')
                                gherkin.push('When the user visits the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                                gherkin.push('Then the pagination bar should not be visible')
                                gherkin.push('Given there are 101 \\"' + h.changeCase.upper(nodeType) + '\\"s')
                                gherkin.push('When the user visits the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                                gherkin.push('Then the pagination bar should be visible')
                            %>
                            "gherkin": "<%- gherkin.join('\\n') %>"
                        }, {
                           "title": "Expecting the pagination bar on the <%= h.changeCase.upper(nodeType) %> overview page to have the necessary navigational elements",
                           <%
                               gherkin = []
                               gherkin.push('Given there are 205 \\"' + h.changeCase.upper(nodeType) + '\\"s')
                               gherkin.push('When the user visits page 2 of the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                               gherkin.push('Then the pagination bar should contain a link to the previous page')
                               gherkin.push('And the pagination bar should contain a link to the next page')
                               gherkin.push('And the pagination bar should indicate that the user is currently on page 2')
                           %>
                           "gherkin": "<%- gherkin.join('\\n') %>"
                       }, {
                           "title": "Expecting the paginated <%= h.changeCase.upper(nodeType) %> overview page to behave identically no matter if visited via the UI or a bookmark",
                           <%
                               gherkin = []
                               gherkin.push('Given there are 105 \\"' + h.changeCase.upper(nodeType) + '\\"s')
                               gherkin.push('When the user visits page 2 of the \\"' + h.changeCase.upper(nodeType) + '\\" overview page via UI')
                               gherkin.push('Then the \\"' + h.changeCase.upper(nodeType) + '\\" list should contain 5 items')
                               gherkin.push('And the pagination bar should indicate that the user is currently on page 2')
                               gherkin.push('When the user visits page 2 of the \\"' + h.changeCase.upper(nodeType) + '\\" overview page via URL')
                               gherkin.push('Then the \\"' + h.changeCase.upper(nodeType) + '\\" list should contain 5 items')
                               gherkin.push('And the pagination bar should indicate that the user is currently on page 2')
                           %>
                           "gherkin": "<%- gherkin.join('\\n') %>"
                       }, {
                           "title": "Expecting no duplicates across the <%= h.changeCase.upper(nodeType) %> overview pages",
                           <%
                               gherkin = []
                               gherkin.push('Given there are 105 \\"' + h.changeCase.upper(nodeType) + '\\"s')
                               gherkin.push('When the user visits page 1 of the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                               gherkin.push('Then all \\"' + h.changeCase.upper(nodeType) + '\\"s in the list should be unique')
                               gherkin.push('When the user visits page 2 of the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                               gherkin.push('Then all \\"' + h.changeCase.upper(nodeType) + '\\"s in the list should be unique')
                           %>
                           "gherkin": "<%- gherkin.join('\\n') %>"
                       }, {
                           "title": "Expecting no <%= h.changeCase.upper(nodeType) %> to be missing across the overview pages",
                           <%
                               gherkin = []
                               gherkin.push('Given there are 105 \\"' + h.changeCase.upper(nodeType) + '\\"s')
                               gherkin.push('When the user visits page 1 of the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                               gherkin.push('Then the \\"' + h.changeCase.upper(nodeType) + '\\" list should contain 100 items')
                               gherkin.push('When the user visits page 2 of the \\"' + h.changeCase.upper(nodeType) + '\\" overview page')
                               gherkin.push('Then the \\"' + h.changeCase.upper(nodeType) + '\\" list should contain 5 items')
                           %>
                           "gherkin": "<%- gherkin.join('\\n') %>"
                       }
                    ]
                }
            ]
        }]
    }
}

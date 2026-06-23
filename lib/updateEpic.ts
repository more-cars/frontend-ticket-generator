import type {Epic} from "./types/Epic"
import {getJiraApiBaseUrl} from "./getJiraApiBaseUrl"
import {getJiraApiAuthKey} from "./getJiraApiAuthKey"

export async function updateEpic(data: Epic): Promise<number> {
    if (!data.dataStructure) {
        return 304
    }

    const response = await fetch(getJiraApiBaseUrl() + 'issue/' + data.jiraId, {
        method: 'PUT',
        headers: {
            'Authorization': `Basic ${getJiraApiAuthKey()}`,
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            fields: {
                customfield_10764: {
                    version: 1,
                    type: 'doc',
                    content: [
                        {
                            "type": "paragraph",
                            "content": [
                                {
                                    "type": "text",
                                    "text": JSON.stringify(data.dataStructure, null, 2),
                                },
                            ]
                        }
                    ]
                },
            }
        })
    })

    return response.status
}

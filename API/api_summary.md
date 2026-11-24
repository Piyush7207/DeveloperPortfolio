
# API Interaction Summary

## 1. What is a REST API?

A REST API is a way for different software applications to communicate over the internet using HTTP requests. It allows applications to access, send, update, and delete data using standard methods such as GET, POST, PUT, and DELETE.

## 2. HTTP Status Codes

| Status Code | Meaning |
|---|---|
| 200 | OK. The request was successful. |
| 404 | Not Found. The requested resource does not exist. |

## 3. jq Filter Used

The following command was used:

```bash
cat API/github_profile.json | jq '{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}'
```

Explanation:

- `cat` reads the JSON file.
- `jq` processes and filters JSON data.
- `name:.name` extracts the GitHub user's name.
- `repos:.public_repos` extracts the number of public repositories.
- `followers:.followers` extracts the follower count.
- `joined:.created_at` extracts the account creation date.

## 4. API Data Collection

- GitHub API: Retrieved my public GitHub profile.
- JSONPlaceholder API: Retrieved sample posts.
- Number of sample posts: 100.

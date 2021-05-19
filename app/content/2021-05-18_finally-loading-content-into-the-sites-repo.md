---
title: Finally loading content into the site's repo
slug: finally-loading-content-into-the-sites-repo
published: 2021-05-18
---

If you had watched my site's repo today, you would have seen that I added seven new posts to the site. These have been sitting on my computer already written, but I've been too embarrassed to commit them to version control until they were proofread. I've got four more written that need to be proofread.

## Thinking of new blog features

Yesterday I created a drafts folder for the site, and today I added a database column that tracks if a post is in draft or if it's published. Draft posts are ignored by Git.

I'm still enjoying that all of my content is in version control, but there are parts of editing the content that are downright painful (literally: my wrist hurts).

Here's the current flow:

1. I make a change in a markdown file.
1. I jump to terminal and rerun the import script.
1. I switch back to my Chrome window.
1. I hit `ctrl` + `r` to reload the page.

After I proofread my remaining content and I've launched this site, the first feature I'd like to add is a watcher that automatically re-runs the imports when the content changes. I'm chasing that great Hugo DX, but with Rails for some reason.

After that, I'd like some way to configure dates in the UI.

That's all for tonight: my wrist really hurts.
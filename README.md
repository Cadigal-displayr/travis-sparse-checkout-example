# Sparse-Checkout for Travis Example Repo
Inspired by https://github.com/derrickstolee/sparse-checkout-example

### Useful references:
- https://docs.travis-ci.com/user/customizing-the-build/#git-sparse-checkout
- https://github.blog/2020-01-17-bring-your-monorepo-down-to-size-with-sparse-checkout/
- https://git-scm.com/docs/git-read-tree#_sparse_checkout

### Gotchas
The `sparse_checkout` file (i.e. `.travis-sparse-checkout.txt`) seems to be always gotten from the `master` branch of the repository. If there is no file on the master branch, sparse checkout is enabled with no files checked out. This results with the error  `error: Sparse checkout leaves no entry on working directory` being printed in the console by `git pull` and the build failing after the third unsuccessful attemp to pull the repository.

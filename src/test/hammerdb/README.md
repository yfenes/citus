
# How to trigger hammerdb benchmark jobs

You can trigger two types of hammerdb benchmark jobs:
-ch_benchmark (analytical and transactional queries)
-tpcc_benchmark (only transactional queries)

Your branch will be run against `master` branch.

In order to trigger the jobs prepend `ch_benchmark/` or `tpcc_benchmark/` to your branch and push it.

For example if you were running on a feature/improvement branch with name `improve/adaptive_executor`. In order to trigger a tpcc benchmark, you can do the following:

```bash
git checkout improve/adaptive_executor
git checkout -b tpcc_benchmark/improve/adaptive_executor
git push origin tpcc_benchmark/improve/adaptive_executor # the tpcc benchmark job will be triggered.
```

You will see the results in a branch in [https://github.com/citusdata/release-test-results](https://github.com/citusdata/release-test-results).

The branch name will be something like: `delete_me/citusbot_tpcc_benchmark_rg/<date>/<date>`.

The resource groups will be deleted automatically but if the benchmark fails, they won't be deleted(If you don't see the results after a reasonable time, it might mean it failed, you can check the resource usage from portal, if it is almost 0 and you didn't see the results, it means it probably failed). In that case, you will need to delete the resource groups manually from portal, the resource groups are `citusbot_ch_benchmark_rg` and `citusbot_tpcc_benchmark_rg`.

These jobs use the hammerdb tool under the hood, please see [https://github.com/citusdata/test-automation#running-automated-hammerdb-benchmark](https://github.com/citusdata/test-automation#running-automated-hammerdb-benchmark) for more details.

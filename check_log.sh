#!/bin/sh

OWNER='smaeyamada'
REPO='github_log'

echo 'List workflow runs for a repository'
# https://docs.github.com/ja/rest/actions/workflow-runs#list-workflow-runs-for-a-repository
curl -H "Accept: application/vnd.github+json" -H "Authorization: token $1" \
  https://api.github.com/repos/$OWNER/$REPO/actions/runs

RUN_ID=""

echo 'Get a workflow run'
# https://docs.github.com/ja/rest/actions/workflow-runs#get-a-workflow-run
curl -H "Accept: application/vnd.github+json" -H "Authorization: token $1" \
  https://api.github.com/repos/$OWNER/$REPO/actions/runs/$RUN_ID

ATTEMPT_NUMBER=""

echo 'Get a workflow run attempt'
# https://docs.github.com/ja/rest/actions/workflow-runs#get-a-workflow-run-attempt
curl -H "Accept: application/vnd.github+json" -H "Authorization: token $1" \
  https://api.github.com/repos/$OWNER/$REPO/actions/runs/$RUN_ID/attempts/$ATTEMPT_NUMBER

WORKFLOW_ID=""

echo 'List workflow runs'
# https://docs.github.com/ja/rest/actions/workflow-runs#list-workflow-runs
curl -H "Accept: application/vnd.github+json" -H "Authorization: token $1" \
  https://api.github.com/repos/$OWNER/$REPO/actions/workflows/$WORKFLOW_ID/runs


echo 'workflow jobs'
JOB_ID=""

echo 'Get a job for a workflow run'
# https://docs.github.com/ja/rest/actions/workflow-jobs#get-a-job-for-a-workflow-run
curl -H "Accept: application/vnd.github+json" -H "Authorization: token $1" \
  https://api.github.com/repos/$OWNER/$REPO/actions/jobs/$JOB_ID

echo 'List jobs for a workflow run attempt'
# https://docs.github.com/ja/rest/actions/workflow-jobs#list-jobs-for-a-workflow-run-attempt
curl -H "Accept: application/vnd.github+json" -H "Authorization: token $1" \
  https://api.github.com/repos/$OWNER/$REPO/actions/runs/$RUN_ID/attempts/$ATTEMPT_NUMBER/jobs

echo 'List jobs for a workflow run'
# https://docs.github.com/ja/rest/actions/workflow-jobs#list-jobs-for-a-workflow-run
curl -H "Accept: application/vnd.github+json" -H "Authorization: token $1" \
  https://api.github.com/repos/$OWNER/$REPO/actions/runs/$RUN_ID/jobs

#!/bin/bash
if [ -z "$KUBERNETES_CONTEXT" ]
then echo "Error: \$KUBERNETES_CONTEXT has not been defined."
     exit 1
else
     echo "Switching to context \"$KUBERNETES_CONTEXT\""
     kubectl config use-context $KUBERNETES_CONTEXT
fi

ACTIVE_CONTEXT=$(kubectl config get-contexts | grep "^\*" | awk '{print $2}')

# Perform sanity check so CI pipeline is aborted in case we're not in the right
# context.
if [ "$ACTIVE_CONTEXT" != "$KUBERNETES_CONTEXT" ]
then echo "Error: sanity check failed - current context \"$ACTIVE_CONTEXT\" does not match context \"$KUBERNETES_CONTEXT\""
     exit 1
fi

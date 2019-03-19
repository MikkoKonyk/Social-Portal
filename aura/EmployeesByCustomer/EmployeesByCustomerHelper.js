({
    getAccounts: function(component, searchTerm) {
        var action = component.get('c.getAccountsBySearchTerm');
        action.setParams({
            "term" : searchTerm
        });
        action.setCallback(this, function(result) {
            var state = result.getState();
            if (state == 'SUCCESS') {
                let res = result.getReturnValue();
                console.log('resultJSON >>> ' + JSON.stringify(res));
                console.log('result >>> ' , res);

            } else {
                component.set('v.isError', true);
                let errors = result.getError();
                component.set('v.errorMessage', errors[0].message);
            }
        });
        $A.enqueueAction(action);
    }
})
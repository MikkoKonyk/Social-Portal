({
    doInit: function(component, event, helper) {
        console.log('hello');
    },

    searchAccounts: function(component, event, helper) {
        var isEnterKey = event.keyCode === 13;
        if (isEnterKey) {
            let queryTerm = component.find('search').get('v.value');
            console.log('Searched for "' + queryTerm + '"!');
            helper.getAccounts(component, queryTerm);
        }
    }
})
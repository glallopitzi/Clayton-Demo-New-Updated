public without sharing class AccountTriggerHandler extends DIA.TriggerHandler {

    private final String DEBUG_HEADER = 'AccountTriggerHandler.';

    private static Integer iAccountsWithOwnerChange = 0;

    public override void beforeInsert() {
        this.assignManager();
    }

}

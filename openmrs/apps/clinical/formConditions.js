
Bahmni.ConceptSet.FormConditions.rulesOverride  = {
    'Baseline, Is alcoholic':null,
    'Baseline, Treatment for drug-susceptible TB': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Treatment for drug-susceptible TB'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, How many drug-susceptible TB treatments", "Baseline, What is the outcome of the last DSTB treatment", "Baseline)
        } else {
            conditions.disable.push("Baseline, How many drug-susceptible TB treatments", "Baseline, What is the outcome of the last DSTB treatment")
        }
        return conditions;
    },
    'Baseline, Treatment for drug-resistant TB': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Treatment for drug-resistant TB'];
        if (conditionConcept == "True") {
            conditions.enable.push("Baseline, How many drug-resistant TB treatments", "Baseline, What is the outcome of the last DRTB treatment")
        } else {
            conditions.disable.push("Baseline, How many drug-resistant TB treatments", "Baseline, What is the outcome of the last DRTB treatment")
        }
        return conditions;
    },
    'Baseline, Start date of past TB treatment': function (formName, formFieldValues) {
        var conceptToEnable = ["Baseline, End date of past TB treatment", "Baseline, Type of past TB treatment", "Baseline, Past TB treatment regimen type", "Baseline, Past TB treatment drug regimen", "Baseline, Past TB treatment outcome"];
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Baseline, Start date of past TB treatment'];
        if (conditionConcept) {
            conditions.enable = conceptToEnable
        } else {
            conditions.disable = conceptToEnable
        }
        return conditions;
    },
    'TI, Did the patient start treatment': function (formName, formFieldValues) {
        var enStartDate = "TUBERCULOSIS DRUG TREATMENT START DATE";
        var enReason = "TI, Reason for not starting treatment";
        var txFacility = "TI, Treatment facility at start";
        var txRegimen = "TI, Type of treatment regimen";
        var secondLine = "TI, Second line regimen drug type";
        var dateOfDeath = "TI, Date of death before treatment start";
        var conditionConcept = formFieldValues['TI, Did the patient start treatment'];
        if (conditionConcept == false) {
            return {enable: [enReason], disable: [enStartDate, txFacility, txRegimen, secondLine]}
        } else if (conditionConcept == true) {
            return {enable: [enStartDate, txFacility, txRegimen], disable: [enReason, dateOfDeath]}
        }
        else {
            return {disable: [enStartDate, txFacility, txRegimen, secondLine, enReason, dateOfDeath]}
        }
    },
    'TI, Type of treatment regimen': function (formName, formFieldValues) {
        var txRegimen = "TI, Type of treatment regimen";
        var secondLine = "TI, Second line regimen drug type";
        var conditionConcept = formFieldValues['TI, Type of treatment regimen'];
         if (conditionConcept == 'Regimen including 2nd line drugs') {
            return {enable: [secondLine]}
        } else {
            return {disable: [secondLine]}
        }
    },
    'HDS, New AE Reported': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HDS, New AE Reported'];
        var conceptEnSAE = "HDS, New SAE reported";
        var conceptSAERefNum = "HDS, New SAE Case number";
        if (conditionConcept != null) {
            if (conditionConcept == true) {
                conditions.enable.push( conceptEnSAE, conceptSAERefNum)
            } else {
                conditions.disable.push( conceptEnSAE, conceptSAERefNum)
            }
        } else {
            conditions.disable.push(conceptEnSAE, conceptSAERefNum)
        }
        return conditions;
    },
    'Bacteriology, Culture results': null,
    'SAE Form, Previously reported as AE': null,
    'EKG, Reporting ECG Related AE': null
}

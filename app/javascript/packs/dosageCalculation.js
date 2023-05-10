$(document).ready(function() {

    // ここから:１回に必要な錠剤の個数
    $("#dosage_indicated").on('change',function() {
      outputWeightRequirement();
    })
    $("#medicine").on('change',function() {
      outputWeightRequirement();
    })
    $("#weight").on('change',function() {
      outputWeightRequirement();
    })
    function outputWeightRequirement() {
      $("#number_of_tablets").empty();
      var inputWeight = $("#weight").val();
      var selectMedicine = $("#medicine").val();
      var inputIndicated = $("#dosage_indicated").val();
      if (inputWeight &&  selectMedicine && inputIndicated) {
        var resultDivision = inputWeight*inputIndicated/selectMedicine;
        $("#number_of_tablets").append(resultDivision.toFixed(2));
        $("#number_of_tablets_value").val(resultDivision.toFixed(2));
        outputTabletRequirement();
        outputRiquidRequirement();
      }
    }
    // ここまで

    // ここから:n日分に必要な錠剤の個数
    $("#dosing_times").on('change',function() {
      outputTabletRequirement();
    })
    $("#several_days").on('change',function() {
      outputTabletRequirement();
    })
    $("#number_of_tablets").on('change',function() {
      outputTabletRequirement();
    })
    function outputTabletRequirement() {
      $("#n_days_tablets").empty();
      var resultDivision = $("#number_of_tablets").text();
      var inputDay = $("#several_days").val();
      var selectTime = $("#dosing_times").val();
      if ( resultDivision && inputDay && selectTime) {
        var resultQuantity = resultDivision*inputDay*selectTime;
        $("#n_days_tablets").append(resultQuantity.toFixed(2));
      }
    }
    // ここまで

    // ここから:溶かすための液体量:
    $("#number_of_tablets").on('change',function() {
      outputRiquidRequirement();
    })
    $("#give_liquid").on('change',function() {
      outputRiquidRequirement();
    })
    function outputRiquidRequirement() {
      $("#liquid_amount").empty();
      var resultDivision = $("#number_of_tablets").text();
      var inputLiquid = $("#give_liquid").val();
      if ( resultDivision && inputLiquid ) {
        var resultQuantity = resultDivision/inputLiquid;
        $("#liquid_amount").append(resultQuantity.toFixed(2));
        $("#liquid_amount_value").append(resultQuantity.toFixed(2));
      }
    }
    // ここまで

});
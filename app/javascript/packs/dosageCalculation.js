$(document).ready(function() {

    // ここから:１回に必要な錠剤の個数
    $("#dosage_indicated").on('change',function() {
      console.log('dosage_indicated');
      outputWeightRequirement();
    })
    $("#medicine").on('change',function() {
      console.log('medicine');
      outputWeightRequirement();
    })
    $("#weight").on('change',function() {
      console.log('weight');
      outputWeightRequirement();
    })
    function outputWeightRequirement() {
      $("#number_of_tablets").empty();
      var inputWeight = $("#weight").val();
      var selectMedicine = $("#medicine").val();
      var inputIndicated = $("#dosage_indicated").val();
      console.log('inputWeight='+inputWeight);
      console.log('selectMedicine='+selectMedicine);
      console.log('inputIndicated='+inputIndicated);
      console.log('outputWeightRequirement()')
      if (inputWeight &&  selectMedicine && inputIndicated) {
        var resultDivision = inputWeight*inputIndicated/selectMedicine;
        $("#number_of_tablets").append(resultDivision.toFixed(1));
        $("#number_of_tablets_value").val(resultDivision.toFixed(1));
        console.log("仕事してますか？")
        outputTabletRequirement();
        outputRiquidRequirement();
      }
    }
    // ここまで

    // ここから:n日分に必要な錠剤の個数
    $("#dosing_times").on('change',function() {
      console.log('dosing_times');
      outputTabletRequirement();
    })
    $("#several_days").on('change',function() {
      console.log('several_days');
      outputTabletRequirement();
    })
    $("#number_of_tablets").on('change',function() {
      console.log('number_of_tablets');
      outputTabletRequirement();
    })
    function outputTabletRequirement() {
      $("#n_days_tablets").empty();
      var resultDivision = $("#number_of_tablets").text();
      var inputDay = $("#several_days").val();
      var selectTime = $("#dosing_times").val();
      console.log('resultDivision='+resultDivision );
      console.log('inputDay='+inputDay );
      console.log('selectTime='+selectTime );
      console.log('outputTabletRequirement()');
      if ( resultDivision && inputDay && selectTime) {
        var resultQuantity = resultDivision*inputDay*selectTime;
        $("#n_days_tablets").append(resultQuantity.toFixed(1));
      }
    }
    // ここまで

    // ここから:溶かすための液体量:liquid_amount
    $("#number_of_tablets").on('change',function() {
      console.log('number_of_tablets');
      outputRiquidRequirement();
    })
    $("#give_liquid").on('change',function() {
      console.log('give_liqui');
      outputRiquidRequirement();
    })
    function outputRiquidRequirement() {
      $("#liquid_amount").empty();
      var resultDivision = $("#number_of_tablets").text();
      var inputLiquid = $("#give_liquid").val();
      console.log('resultDivision='+resultDivision );
      console.log('inputLiquid='+inputLiquid );
      console.log('outputRiquidRequirement()');
      if ( resultDivision && inputLiquid ) {
        var resultQuantity = resultDivision/inputLiquid;
        $("#liquid_amount").append(resultQuantity.toFixed(1));
        $("#liquid_amount_value").append(resultQuantity.toFixed(1));
      }
    }
    // ここまで



});
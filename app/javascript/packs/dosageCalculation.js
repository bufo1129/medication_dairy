$(document).ready(function() {

    // ここから１回に必要な錠剤の個数・計算上から順番に入力しないと処理はしらない＋そもそも発火しない
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
      var selectMedicine = $("medicine").val();
      var inputIndicated = $("#dosage_indicated").val();
      if (inputWeight &&  selectMedicine && inputIndicated) {
        var resultDivision = inputWeight*inputIndicated/selectMedicine;
        $("#number_of_tablets").append(resultDivision.toFixed(1));
        console.log("仕事してますか？");
        $("#number_of_tablets_value").val(resultDivision.toFixed(1));
      }
    }
    // ここまで


    // 体重に対する必要量↓
    $("#dosage_indicated").focusout(function() {
      outputWeightRequirement();
    })
    $("#weight").focusout(function() {
      outputWeightRequirement();
    })
    // ↓outputWeightRequirementメソッドとしてまとめてる
    function outputWeightRequirement() {
      $("#weight_requirement").empty();
      var inputWeight = $("#weight").val();
      var inputIndicated = $("#dosage_indicated").val();
      if (inputWeight && inputIndicated) {
        var resultDivision = inputWeight*inputIndicated;
        $("#weight_requirement").append(resultDivision.toFixed(1));
        $("#weight_requirement_value").val(resultDivision.toFixed(1));
      }
    }
    // ↑体重に対する必要量ここまで

});
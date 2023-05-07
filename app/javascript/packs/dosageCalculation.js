$(document).ready(function() {
    $("#dosage_indicated").on('change',function() {
      outputWeightRequirement();
    })
    $("#weight").on('change',function() {
      outputWeightRequirement();
    })

    function outputWeightRequirement() {
      $("#required_quantity").empty();
      var inputWeight = $("#weight").val();
      var inputIndicated = $("#dosage_indicated").val();
      var selectMedicine = $("medicine");
      if (inputWeight && inputIndicated && selectMedicine) {
        console.log("仕事してますか？");
        var resultDivision = inputWeight*inputIndicated/selectMedicine;
        $("#required_quantity").append(resultDivision.toFixed(1));
        $("#required_quantity_value").val(resultDivision.toFixed(1));
      }
    }


    // $("#dosage_indicated").focusout(function() {
    //   outputWeightRequirement();
    // })
    // $("#weight").focusout(function() {
    //   outputWeightRequirement();
    // })
    // // ↓outputWeightRequirementメソッドとしてまとめてる
    // function outputWeightRequirement() {
    //   $("#weight_requirement").empty();
    //   var inputWeight = $("#weight").val();
    //   var inputIndicated = $("#dosage_indicated").val();
    //   if (inputWeight && inputIndicated) {
    //     var resultDivision = inputWeight*inputIndicated;
    //     $("#weight_requirement").append(resultDivision.toFixed(1));
    //     $("#weight_requirement_value").val(resultDivision.toFixed(1));
    //   }
    // }


});
function orgFloor(value, base) {
　return Math.floor(value * base) / base;
}

$(document).ready(function() {
    $("#dosage_indicated").focusout(function() {
      outputWeightRequirement();
    })
    $("#weight").focusout(function() {
      outputWeightRequirement();
    })
    function outputWeightRequirement() {
      $("#weight_requirement").empty();
      var inputWeight = $("#weight").val();
      var inputIndicated = $("#dosage_indicated").val();
      if (inputWeight && inputIndicated) {
        var resultDivision = inputWeight*inputIndicated;
        $("#weight_requirement").append(resultDivision);
        $("#weight_requirement_value").val(resultDivision);
      }
    }
});
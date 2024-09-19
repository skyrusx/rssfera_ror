$(document).on('turbo:load', function() {
  $('#generate-slug').click(function() {
    let slugValues = [];
    let slug = "";

    $("input.slug-item").each(function() {
      if ($(this)[0].value.length) {
        slugValues.push($(this)[0].value);
      }
    });

    slug = slugValues.join("-").replace(/ /g, '-');

    $("input.slug").val(translit(slug).toLowerCase());
  });

  $("#realty-slug").click(function() {
    let category = $("#realty_realty_category_id")[0].value
    let employee = $("#realty_team_member_id")[0].value
    let city = $("#realty_city_id")[0].value
    let district = $("#realty_district_id")[0].value
    let street = $("#realty_street_id")[0].value
    let realty_id = $("#realty_id")[0].value
    let partSlug = ""
    let slug = ""

    partSlug = [category, employee, city, district, street].join("")
    slug = [partSlug, realty_id].join("-")
    $("#realty_slug").val(slug)
  });

  function translit(word) {
    var answer = '';
    var converter = {
      'а': 'a',    'б': 'b',    'в': 'v',    'г': 'g',    'д': 'd',
      'е': 'e',    'ё': 'e',    'ж': 'zh',   'з': 'z',    'и': 'i',
      'й': 'y',    'к': 'k',    'л': 'l',    'м': 'm',    'н': 'n',
      'о': 'o',    'п': 'p',    'р': 'r',    'с': 's',    'т': 't',
      'у': 'u',    'ф': 'f',    'х': 'h',    'ц': 'c',    'ч': 'ch',
      'ш': 'sh',   'щ': 'sch',  'ь': '',     'ы': 'y',    'ъ': '',
      'э': 'e',    'ю': 'yu',   'я': 'ya',

      'А': 'A',    'Б': 'B',    'В': 'V',    'Г': 'G',    'Д': 'D',
      'Е': 'E',    'Ё': 'E',    'Ж': 'Zh',   'З': 'Z',    'И': 'I',
      'Й': 'Y',    'К': 'K',    'Л': 'L',    'М': 'M',    'Н': 'N',
      'О': 'O',    'П': 'P',    'Р': 'R',    'С': 'S',    'Т': 'T',
      'У': 'U',    'Ф': 'F',    'Х': 'H',    'Ц': 'C',    'Ч': 'Ch',
      'Ш': 'Sh',   'Щ': 'Sch',  'Ь': '',     'Ы': 'Y',    'Ъ': '',
      'Э': 'E',    'Ю': 'Yu',   'Я': 'Ya'
    };

    for (var i = 0; i < word.length; ++i ) {
      if (converter[word[i]] == undefined){
        answer += word[i];
      } else {
        answer += converter[word[i]];
      }
    }

    return answer;
  }
});

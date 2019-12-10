/**
 * 공용 스크립트
 * common.js
 */

function getCookie(Name) {
    var search = Name + "=";
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search);
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length;
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length;
            return unescape(document.cookie.substring(offset, end));
        }
    }
    return "";
}

function chkEmpty(obj) {
    if(obj == "" || obj == null || obj == undefined || (obj != null && typeof obj == "object" && !Object.keys(obj).length)){
        return true;
    } else {
        return false;
    }
}

function leadingZeros(n, digits) {
    var zero = '';
    n = n.toString();

    if (n.length < digits) {
      for (var i = 0; i < digits - n.length; i++)
        zero += '0';
    }
    return zero + n;
}

function getTimeStamp(obj) {
    var d = obj;
    var s = leadingZeros(d.getFullYear() , 4) + '-' +
            leadingZeros(d.getMonth() + 1, 2) + '-' +
            leadingZeros(d.getDate()     , 2) + ' ' +
            leadingZeros(d.getHours()    , 2) + ':' +
            leadingZeros(d.getMinutes()  , 2) + ':' +
            leadingZeros(d.getSeconds()  , 2);
    return s;
}

function model_logout_content() {
    var contents = $(".content-wrapper");
    var tag = '';
    tag += '<div class="modal fade" id="modal-logout">';
    tag += '    <div class="modal-dialog">';
    tag += '        <div class="modal-content">';
    tag += '            <div class="modal-header">';
    tag += '                <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
    tag += '                    <span aria-hidden="true">&times;</span></button>';
    tag += '                <h4 class="modal-title">로그아웃</h4>';
    tag += '            </div>';
    tag += '            <div class="modal-body">';
    tag += '                <p>로그아웃 하시겠습니까?</p>';
    tag += '            </div>';
    tag += '            <div class="modal-footer">';
    tag += '                <button type="button" class="btn btn-default" data-dismiss="modal"> 취 소 </button>';
    tag += '                <button type="button" class="btn btn-primary btn-logout"> 확 인 </button>';
    tag += '            </div>';
    tag += '        </div>';
    tag += '        <!-- /.modal-content -->';
    tag += '    </div>';
    tag += '    <!-- /.modal-dialog -->';
    tag += '</div>';
    tag += '<!-- /.modal -->';
    contents.append(tag);
    
}

function selectSidebar(name) {
    //console.log('sidebar-menu cnt : ' + $('ul.sidebar-menu > li').length);
    //name = 'se-admin'
    $('ul.sidebar-menu').find('li').each(function (i,e) {
        if ($(e).hasClass(name)) {
            $(e).addClass('active');
        } else {
            $(e).removeClass('active');
        }
    });
}

function selectSidebar(name, subname) {
    //console.log('sidebar-menu cnt : ' + $('ul.sidebar-menu > li').length);
    //console.log('sidebar-menu cnt : ' + $(e1).find('ul > li').length);
    //name = 'se-admin'
    var elem;
    $('ul.sidebar-menu').find('li').each(function (i,e1) {
        if ($(e1).hasClass(name)) {
            elem = e1;
            $(e1).addClass('active');
        } else {
            $(e1).removeClass('active');
        }
    });
    $(elem).find('ul > li').each(function (i,e2) {
        if ($(e2).hasClass(subname)) {
            $(e2).addClass('active');
        } else {
            $(e2).removeClass('active');
        }
    });
}




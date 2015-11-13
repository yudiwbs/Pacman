/* 
   Dipanggil oleh monster_obj
   melihat arah mana yang harus diambil
   
   parameter 1: instance monster (dipassing self)
   paramater 2: array berisi arah random  
   
   return arah yang diambil berdasarkan nilai random dan bisa (tidak ada dinding)       
   1: kiri, 2: atas, 3 kanan, 4 bawah
*/

//param: obj monsternya
var obj      = argument0; // parameter 1, instance monster (dipassing self)
var vArrArah = argument1; // paramater 2, urutan arah random yg dipilih  
var i  = 0;

var arrHadap = arahYgMungkin(obj);
i = array_length_1d(arrHadap);

//cari arah random pertama yang tersedia
var ketemu = false;
var arahKetemu = -1;
for (var j=0; j<4; j++) {
    for (var k=0; k<i; k++) {
        if vArrArah[j]==arrHadap[k] {
            ketemu = true;
            arahKetemu = vArrArah[j];
            break;
        }
    }   
}

//harusnya pasti ketemu
if (!ketemu) {
   show_message("error di cariAlternatifArah");
   return -1;
} else { 
  return arahKetemu;
}





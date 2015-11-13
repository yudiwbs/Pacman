/*
   Dipanggil oleh monster_obj (walaupun bisa yg lain)
   memutuskan arah mengejar
   
   parameter 1: instance monster (dipassing self)
   
   return arah yang diambil berdasarkan posisi pacman_obj       
   1: kiri, 2: atas, 3 kanan, 4 bawah
*/   


var obj = argument0; // parameter 1, instance monster (dipassing self)

var px = pacman_obj.x;
var py = pacman_obj.y;
var absDx = abs(obj.x - px);
var absDy = abs(obj.y - py);

//menyimpan alternatif arah utk mengejar, terurut berdasarkan
//prioritas
var arrAlternatifArah;  

var i = 0;

var arahHoriz=-1;
var arahVer=-1;

if (obj.x > px ) {
   //monster ada di kanan pacman, gerak ke kiri
   arahHoriz = 1; 
} else  {
   //gerak ke kanan
   arahHoriz = 3; 
}        

if (obj.y > py) {
   //monster ada dibawah, gerak ke atas
   arahVer = 2; 
} else { 
   //gerak ke bawah
   arahVer = 4; 
}


if (absDx) > (absDy) {
   //x lebih jauh daripada y
   //perkecil jarak x
   show_debug_message("x lebih jauh ambil arah horiz="+string(arahHoriz));
   arrAlternatifArah[i] = arahHoriz;  //prioritas 1
   i++; 
   arrAlternatifArah[i] = arahVer;   //prioritas 2
   i++;
} else 
{
   show_debug_message("y lebih jauh ambil arah ver="+string(arahVer));
   arrAlternatifArah[i] = arahVer;     //prioritas 1
   i++; 
   arrAlternatifArah[i] = arahHoriz;   //prioritas 2
   i++;         
}



//cari arah yg mungkin yg tidak ada tembok
//kalau semua alternatif arah pengejaran ada tembok, ambil yg pertama yg tersedia
var arrArahMungkin = arahYgMungkin(obj);
var jumArahMungkin = array_length_1d(arrArahMungkin);

//cari arah random pertama yang tersedia
var ketemu = false;
var arahKetemu = -1;

var j = 0;
var ketemu = false;
while (j<2 && !ketemu) {
    var k = 0;
    while (k<jumArahMungkin && !ketemu) {
        if  arrAlternatifArah[j]==arrArahMungkin[k] {
            ketemu = true;
            arahKetemu = arrAlternatifArah[j];
             
        }
        k++;
    }  
    j++; 
}

if (ketemu) {   
  return arahKetemu;
} else 
{
  //arah pengejaran tidak tersedia, ambil saja arah alternatif yg ada  
  return arrArahMungkin[0];
}

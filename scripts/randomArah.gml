/*
   Dipanggil oleh monster_obj
   memutuskan arah mana yang harus diambil
   
   parameter 1: instance monster (dipassing self)
   
   return arah yang diambil berdasarkan nilai random dan bisa (tidak ada dinding)       
   1: kiri, 2: atas, 3 kanan, 4 bawah
*/   


var obj = argument0; // parameter 1, instance monster (dipassing self)

var i=0;
var tArah=-1;
var t;
while (i<4) {
  t = random_range(0,1);
  //cari arah secara random
  if (t<=0.25) {  
     tArah =  4; 
  } else if (t<=0.5) {
     tArah =  3;
  } else if (t<=0.75) {
     tArah = 2;
  } else {
     tArah = 1;
  }
  //cek apakah sudah ada sebelumnya 
  var ada = false;
   
  for (var j=0;j<i;j++) {
     if  (tArah == arrArah[j]) {
        ada = true;
        break;
     } 
  }
  if (!ada)  {  
     arrArah[i] = tArah;
     i  = i+1;
  }
}

//hasilnya misalnya 2,4,3,1 artinya diprioritaskan ke atas (2), kalau ada tembok, ke bawah (4) dst

//cari arah yg mungkin yg tidak ada tembok
var arrArahMungkin = arahYgMungkin(obj);
jumArahMungkin = array_length_1d(arrArahMungkin);

//cari arah random pertama yang tersedia
var ketemu = false;
var arahKetemu = -1;

var j = 0;
while (j<4 && !ketemu) {
    var k=0;
    while (k<jumArahMungkin && !ketemu) {
        if  arrArah[j]==arrArahMungkin[k] {
            ketemu = true;
            arahKetemu = arrArah[j];            
        }
        k++;
    }   
    j++;
}

//harusnya pasti ketemu
if (!ketemu) {
   show_message("error di cariAlternatifArah");
   return -1;
} else { 
  return arahKetemu;
}





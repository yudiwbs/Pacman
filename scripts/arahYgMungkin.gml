//arah yg tidak ada temboknya
//return array
//gunakan array_length_1d untuk mengetahui panjang array


//param: obj monsternya
var obj      = argument0; // parameter 1, instance monster (dipassing self)
var i=0;
var arrHadap;

if (!place_meeting(obj.x, obj.y-3, wall_obj)) {
   //atas
   arrHadap[i] = 2; 
   i++;    
} 

if (!place_meeting(obj.x+3, obj.y, wall_obj)) {
   //kanan
   arrHadap[i] = 3;
   i++;
}
//kiri
if (!place_meeting(obj.x-3, obj.y, wall_obj)) {
    arrHadap[i] = 1;
    i++;
}
//bawah
if (!place_meeting(obj.x, obj.y+3, wall_obj)) {
    arrHadap[i] = 4;
    i++;
}

return arrHadap;

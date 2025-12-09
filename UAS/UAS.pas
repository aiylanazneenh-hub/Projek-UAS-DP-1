program Roster;
uses crt;

type
    Jadwal = record
        mapel : string;
        hari  : string;
        jam   : string;
    end;

var
    dataJadwal : array[1..100] of Jadwal;
    total : integer;

procedure tambahJadwal;
begin
    total := total + 1;
    write('Masukkan nama mata pelajaran: ');
    readln(dataJadwal[total].mapel);
    write('Masukkan hari (Senin-Sabtu): ');
    readln(dataJadwal[total].hari);
    write('Masukkan jam (contoh: 08:00): ');
    readln(dataJadwal[total].jam);
    writeln('Jadwal berhasil ditambahkan!');
end;

procedure tampilSemua;
var i : integer;
begin
    writeln('=== Semua Jadwal ===');
    if total = 0 then
        writeln('Belum ada jadwal')
    else
        for i := 1 to total do
            writeln(i, ') ', dataJadwal[i].hari, ' - ', dataJadwal[i].jam, ' : ', dataJadwal[i].mapel);
end;

procedure tampilPerHari;
var
    i : integer;
    cariHari : string;
    ketemu : boolean;
begin
    ketemu := false;  // inisialisasi awal

    write('Cari jadwal di hari apa? (Senin-Sabtu): ');
    readln(cariHari);
    
    writeln('=== Jadwal Hari ', cariHari, ' ===');
    for i := 1 to total do
        if (dataJadwal[i].hari = cariHari) then
        begin
            writeln('- ', dataJadwal[i].jam, ' : ', dataJadwal[i].mapel);
            ketemu := true;
        end;

    if ketemu = false then
        writeln('Tidak ada jadwal untuk hari tersebut.');
end;

var
    pilih : integer;

begin
    total := 0;
    repeat
        clrscr;
        writeln('===== MENU JADWAL PELAJARAN =====');
        writeln('1. Tambah Jadwal');
        writeln('2. Tampilkan Semua Jadwal');
        writeln('3. Tampilkan Jadwal Berdasarkan Hari');
        writeln('4. Keluar');
        write('Pilih menu: ');
        readln(pilih);

        case pilih of
            1: tambahJadwal;
            2: tampilSemua;
            3: tampilPerHari;
        end;

        readln;
    until pilih = 4;
end.
#!/data/data/com.termux/files/usr/bin/bash

clear
echo "=== TOOLS KENON ==="
read -p "Masukkan nomor yang mau di kenon kan(contoh: +628xxxx): " nomor
read -p "DESK TAMBAHAN : " deskripsi
tanggal=$(date '+%Y-%m-%d %H:%M:%S')

email_tujuan="spam@support.whatsapp.com"
subject="Permohonan Peninjauan dan Tindakan terhadap Nomor WhatsApp yang Melakukan Penyalahgunaan - $nomor"

# Surat panjang, versi super formal
body="Kepada Yth. Tim Penanganan Pelanggaran WhatsApp
di Tempat

Dengan hormat,

Saya sebagai pengguna aktif WhatsApp dengan ini mengajukan laporan atas dugaan penyalahgunaan layanan oleh salah satu nomor yang menggunakan platform WhatsApp, yaitu nomor: $nomor.

Pada tanggal $tanggal, saya menerima pesan yang berisi konten tidak pantas, spam berulang, dan/atau dugaan penipuan dari nomor tersebut. Bentuk pesan yang dikirimkan bersifat mengganggu, tidak diminta, dan melanggar ketentuan layanan WhatsApp. Pesan tersebut juga memiliki potensi membahayakan pengguna lain, baik secara psikologis maupun finansial. Adapun ringkasan dari isi pesan yang diterima adalah sebagai berikut:

\"$deskripsi\"

Laporan ini saya ajukan sebagai bentuk kontribusi saya terhadap keamanan dan kenyamanan sesama pengguna WhatsApp. Saya memahami bahwa WhatsApp memiliki komitmen terhadap perlindungan pengguna dan berhak mengambil tindakan tegas terhadap pihak-pihak yang menyalahgunakan platform ini untuk tujuan yang tidak sesuai.

Berikut alasan mengapa saya merasa nomor tersebut harus segera ditinjau dan diblokir:

1. Telah mengirimkan pesan yang tidak diminta (unsolicited messages) secara berulang.
2. Mengandung potensi penipuan dan merugikan secara finansial.
3. Mengganggu kenyamanan pribadi saya sebagai pengguna.
4. Berpotensi mengulangi tindakannya ke pengguna lain.

Saya berharap tim WhatsApp dapat segera melakukan verifikasi terhadap laporan ini, serta mengambil tindakan yang sesuai berdasarkan kebijakan privasi dan pedoman komunitas yang berlaku. Saya juga bersedia memberikan informasi atau bukti tambahan jika diperlukan demi mendukung kelengkapan laporan ini.

Demikian laporan ini saya sampaikan dengan sebenar-benarnya. Atas perhatian dan kerjasamanya, saya ucapkan terima kasih.

Hormat saya,

Pengguna WhatsApp,
(yang peduli terhadap keamanan digital)"

# Encode ke URL (agar Gmail bisa buka)
subject_enc=$(echo "$subject" | sed 's/ /%20/g')
body_enc=$(echo "$body" | sed 's/ /%20/g' | sed 's/\n/%0A/g')

# Auto-buka Gmail app dengan isi siap dikirim
termux-open-url "mailto:$email_tujuan?subject=$subject_enc&body=$body_enc"

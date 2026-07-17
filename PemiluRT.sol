// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PemiluRT {
    struct Kandidat {
        string nama;
        uint jumlahSuara;
    }

    mapping(address => bool) public sudahMemilih;
    Kandidat[] public daftarKandidat;

    constructor(string[] memory namaKandidat) {
        for (uint i = 0; i < namaKandidat.length; i++) {
            daftarKandidat.push(Kandidat(namaKandidat[i], 0));
        }
    }

    function vote(uint indexKandidat) public {
        require(!sudahMemilih[msg.sender], "Anda sudah memilih!");
        require(indexKandidat < daftarKandidat.length, "Kandidat tidak ada.");

        sudahMemilih[msg.sender] = true;
        daftarKandidat[indexKandidat].jumlahSuara++;
    }

    function cekHasil(uint indexKandidat) public view returns (uint) {
        return daftarKandidat[indexKandidat].jumlahSuara;
    }
}


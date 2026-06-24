// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SkillProof {
    struct Certificate {
        string skill;
        string issuer;
        uint256 issuedAt;
    }

    mapping(address => Certificate[]) private certificates;

    event CertificateIssued(address indexed user,string skill,string issuer);

    function issueCertificate(address user,string memory skill,string memory issuer) external {
        certificates[user].push(Certificate(skill, issuer, block.timestamp));
        emit CertificateIssued(user, skill, issuer);
    }

    function getCertificates(address user) external view returns (Certificate[] memory) {
        return certificates[user];
    }
}

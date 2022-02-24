#! /bin/bash
trivy config .
trivy fs .
semgrep --config=p/security-audit .
semgrep --config=p/secrets .
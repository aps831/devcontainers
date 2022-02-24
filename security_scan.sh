#! /bin/bash
semgrep --config=p/security-audit .
semgrep --config=p/secrets .
#!/usr/bin/env bats

@test "weblogic zip downloaded" {
  run test -f /home/vagrant/V13672-01.zip
  [ "$status" -eq 0 ]
}

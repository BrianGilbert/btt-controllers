#!/usr/bin/env bats

#####
# DESCRIPTION: Unit tests for the volume-controller shell script.
#####


##### @interface #####
volume_controller='./control-strip/volume-controller.sh'
test_status_root_directory='/tmp/btt/tests' # Passed to the controller.
test_status_directory="${test_status_root_directory}/volume-service"
test_status_filepath="${test_status_directory}/status"


##### @implementation #####
function set_up() {
	# Create a tmp status file for the controller during the test.
	mkdir -p "${test_status_directory}"
	touch "${test_status_filepath}"
}

function tear_down() {
	# Remove the tmp status file.
	rm "${test_status_filepath}"
}

# $1: Base64-encoded image data.
# $return: a formatted BetterTouchTool update payload.
function btt_payload() {
	echo "{\"text\":\"volume\", \"icon_data\": \"$1\"}"
}

# $1: Current status.
# $2: Expected base64-encoded image data.
function verify_icon_for_volume() {
	echo "$1" > "${test_status_filepath}"
	local expected_payload
	expected_payload="$(btt_payload $2)"
	local payload
	payload="$($volume_controller ${test_status_root_directory})"
	[[ "${payload}" = "${expected_payload}" ]]
}

@test 'icon appearance for unmuted volume levels' {
	set_up

	# 3 bars
	verify_icon_for_volume '100' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAAM1BMVEUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACjBUbJAAAAEXRSTlMAz\/9A7xBQj5+\/IICv33BgMNi9EfoAAAEoSURBVHgB7ZUBi4QgEIX1jWY7m9X\/\/7UHx\/Qgw5s9DwKOPgCC9dPX09zwX3h4iJBxOSHlYXkCShhmxh+C54RX8JGUNFx5e0vbIEhTsy29eOleOMsJNXNWdSKDMmt+27zA6kWmbCzc4QXRi9zKyqU3QJ3IlKOVPqMy9+ZEpnxs7ARMR\/NzI224IvbDboUXO2WXc5J6cqgm0VmBRkZXLohnRz6XOVYAPR7kUznbw07nFzLH3iH7sW8prKD6W+Ufktg7JKt3PDlJKNdrTOWb0srVhsoPHwaZUivvljr1P0mi8SRnPS6D4l0G9lKUyUxlsfb70VtZuHDmUz96I1fef2s\/NSmtbFWzfS\/6HkjWwLok+GQd+aNz3kZGXQGWUZelD8rTiMYS7+Ph4QufIgmRGZQddAAAAABJRU5ErkJggg=='
	verify_icon_for_volume '66' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAAM1BMVEUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACjBUbJAAAAEXRSTlMAz\/9A7xBQj5+\/IICv33BgMNi9EfoAAAEoSURBVHgB7ZUBi4QgEIX1jWY7m9X\/\/7UHx\/Qgw5s9DwKOPgCC9dPX09zwX3h4iJBxOSHlYXkCShhmxh+C54RX8JGUNFx5e0vbIEhTsy29eOleOMsJNXNWdSKDMmt+27zA6kWmbCzc4QXRi9zKyqU3QJ3IlKOVPqMy9+ZEpnxs7ARMR\/NzI224IvbDboUXO2WXc5J6cqgm0VmBRkZXLohnRz6XOVYAPR7kUznbw07nFzLH3iH7sW8prKD6W+Ufktg7JKt3PDlJKNdrTOWb0srVhsoPHwaZUivvljr1P0mi8SRnPS6D4l0G9lKUyUxlsfb70VtZuHDmUz96I1fef2s\/NSmtbFWzfS\/6HkjWwLok+GQd+aNz3kZGXQGWUZelD8rTiMYS7+Ph4QufIgmRGZQddAAAAABJRU5ErkJggg=='

	# 2 bars
	verify_icon_for_volume '65' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6\/NlyAAABwklEQVR4Ae2aIaz6MBDGT839E\/TUFI5kyV\/hqlBPLEHhnkLjFd7UK7x6XuHVvKpX9WpvJCcuL498F1bWvvR+yQWxdvBxH+3tCtWNYRiGYRiGYRznOM\/RUiV8suDHa0MV0D0Ec+ypEhwLrsbajbD2R2mZiBwdpeV\/aVm+zjGJcKRnFHM0WT5QRjZz3IXQVwRHnhP4fpos\/8tp4Wmh4EHMu4Isnzl2mS2MBQO+eF4EWT6w4GNuCy8V3CmzvJW2zmNhveARrOA3nhuUtt7mszAWLBenu+K3PCjqa7e0Zp0ShgPv0YMV2wOnLS5C4rsFMwEIugEXPNgJW7\/MtJJgz9dH+p2LuMcz2r8k2AFB8nqnENyWLngDxvTgOlO6YAkeY4J\/Ypa2Rau8bSnUsS3pC4\/x3YXHJX9pib8QZp+qv9XN4Z6ETyA4gLLRrffwoO9MxASCe2DnWMLjoXTB+KLgDc9HDQCfoQEA8Yk7Hje5HSlaPCfKwJCoieeU2W3yH7uwxRcKDsoG3g7YeVV8AsEDGHcC21FWi\/eEwIuZZFvqgRp\/+PIP00pmX9NxaSvEHqgCTlX95UEI7qgSGt5zDcMwDMMwjGL4BoAv8WBJyctXAAAAAElFTkSuQmCC'
	verify_icon_for_volume '33' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6\/NlyAAABwklEQVR4Ae2aIaz6MBDGT839E\/TUFI5kyV\/hqlBPLEHhnkLjFd7UK7x6XuHVvKpX9WpvJCcuL498F1bWvvR+yQWxdvBxH+3tCtWNYRiGYRiGYRznOM\/RUiV8suDHa0MV0D0Ec+ypEhwLrsbajbD2R2mZiBwdpeV\/aVm+zjGJcKRnFHM0WT5QRjZz3IXQVwRHnhP4fpos\/8tp4Wmh4EHMu4Isnzl2mS2MBQO+eF4EWT6w4GNuCy8V3CmzvJW2zmNhveARrOA3nhuUtt7mszAWLBenu+K3PCjqa7e0Zp0ShgPv0YMV2wOnLS5C4rsFMwEIugEXPNgJW7\/MtJJgz9dH+p2LuMcz2r8k2AFB8nqnENyWLngDxvTgOlO6YAkeY4J\/Ypa2Rau8bSnUsS3pC4\/x3YXHJX9pib8QZp+qv9XN4Z6ETyA4gLLRrffwoO9MxASCe2DnWMLjoXTB+KLgDc9HDQCfoQEA8Yk7Hje5HSlaPCfKwJCoieeU2W3yH7uwxRcKDsoG3g7YeVV8AsEDGHcC21FWi\/eEwIuZZFvqgRp\/+PIP00pmX9NxaSvEHqgCTlX95UEI7qgSGt5zDcMwDMMwjGL4BoAv8WBJyctXAAAAAElFTkSuQmCC'

	# 1 bar
	verify_icon_for_volume '32' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6\/NlyAAABrElEQVR4Ae2ZAWbEQBSGBwRYQoGAAQFCWBBgQEBRAgIsWAA9Qm+QI+0RcoQcIUdIZ3l4WjW\/ZDbzat7HU2Sor+\/vm8nEKIqiKIqiKEreDL7uviqTCTcSfv4sTAZYEn5WZzLBkXA20S5YtN+ldWKlsiYuV2ld\/vK1sXKRJzHvcm8SUvp6kOQuYSYykhjS5UvKCG+AMDqJr4Eu36madBEGhAF6vt8C64bUET4qfAG7XPNYp4wwIjwHJrgjkRGMdZ0uwoAw+2M9gP9lC0x1d\/TMukUsF\/gdbWBid4GkHT6ErK8WJhZ6Ph2QaVgSdrOdJDzR8\/mATPWfhB1bE5K5AGsq6cJlYM0bIiNemAOsUeGfaKR1aMnblpY8tiX84DG8+uDxKeRoOQJHyy7W\/Zb15f6oKYLwEnh5qM55ecD58LVGEG4Dcb5JeD3kKZh3Cpe+LHAB0Em5AOBMkDCOA0V64JIgScSdwanA7hbguiQRdwZnBC\/wGjjOJzBFELbAOmw7ShDx1uAUQMdqqR\/UaBLL\/5gmmS6nz6V8gvcmA35P8EyErckEmuCKoiiKoiiKHL4BRZ7KNXRjQgYAAAAASUVORK5CYII='
	verify_icon_for_volume '1' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6\/NlyAAABrElEQVR4Ae2ZAWbEQBSGBwRYQoGAAQFCWBBgQEBRAgIsWAA9Qm+QI+0RcoQcIUdIZ3l4WjW\/ZDbzat7HU2Sor+\/vm8nEKIqiKIqiKEreDL7uviqTCTcSfv4sTAZYEn5WZzLBkXA20S5YtN+ldWKlsiYuV2ld\/vK1sXKRJzHvcm8SUvp6kOQuYSYykhjS5UvKCG+AMDqJr4Eu36madBEGhAF6vt8C64bUET4qfAG7XPNYp4wwIjwHJrgjkRGMdZ0uwoAw+2M9gP9lC0x1d\/TMukUsF\/gdbWBid4GkHT6ErK8WJhZ6Ph2QaVgSdrOdJDzR8\/mATPWfhB1bE5K5AGsq6cJlYM0bIiNemAOsUeGfaKR1aMnblpY8tiX84DG8+uDxKeRoOQJHyy7W\/Zb15f6oKYLwEnh5qM55ecD58LVGEG4Dcb5JeD3kKZh3Cpe+LHAB0Em5AOBMkDCOA0V64JIgScSdwanA7hbguiQRdwZnBC\/wGjjOJzBFELbAOmw7ShDx1uAUQMdqqR\/UaBLL\/5gmmS6nz6V8gvcmA35P8EyErckEmuCKoiiKoiiKHL4BRZ7KNXRjQgYAAAAASUVORK5CYII='

	# 0 bars
	verify_icon_for_volume '0' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6\/NlyAAABpElEQVR4Ae2ZAYYDMRiFBwQYSoEBAwqUpWCAgAHFMiBAQQHsEfYGPdIeYY\/SI8ymBGGt9zTTJDbv47fYQb7+z59MpmsbIYQQQgghFl9XX0MrwpeHcPhrWhAeH8Khpq4RbBBuJtomiva5tk7cQ43dtpxq6\/KnrzUqmzKJQZfnkqI7X19BEgqDSeyCGNPlvmSEV14YTuIT6PI11LFwhIEwZo73W+K5pXSEU4V7ssuHONZlIswLL6GDPdhvHRnrQ8kIY2G8l46RzEhMdZt6Zl03LAviuAcTewJJSz6E3F8tHHBAiJE5Rj\/c06yZhCcwZRmZoUphuFj8\/554Zqhd2IDF7kmZ+oX5xUr4F4q0hlZ925JrZVtiDx7Lqw8eHwWOlvAHASk5b3Elav+o2wbCDix0yPPywPPu676B8B7E+ZL39RCn4PtJYeOrJy4ApgIXAJAbL0xhSZEZTPkMEU8XHsjuGvxcpognCjvyAu8IUpCVW5Iwnsx4yheO+FvHY4iOHWr9oLYDnUr\/mNYAU0ufS+MJPv9XSTzBGxAeG3AFE7wQQgghhBDiBwMUs5HKdLyOAAAAAElFTkSuQmCC'

	tear_down
}

@test 'icon appearance for muted volume levels' {
	set_up

	# muted 3 bars
	verify_icon_for_volume '-100' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAAM1BMVEUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACjBUbJAAAAEXRSTlMAz\/9AcIAg7xBQj2C\/n9+vMImzzagAAAF8SURBVHgB7JXbjoMwDAVPjiG3lsD\/f+1WFrWogQheV8xLsxKzE5lE4OHhvxAo2DGMEVdITBmOQqYBXezBCseLH95X4hP3G6\/ktXhOfMMjzcclpYg9o6Yd2eL2EGU3Zk3PQDee3\/yVE1u2\/xqBTjwmOrmQI5RMHs9GVJozSnIyZnvDMwMOybPGy2fh5Gjpl+17R9nEVQ7r0Cc22\/cLSjeu8vfFFrJ8Jz8dHTJr6sLtMrFCmXbnRAVrrgulrZI5A+lkGj5eGX4dOZF9XOxZ\/Y3fhRzLFh80XjPyOvbFnL6s8ahHtMlnIeb0ZWPaxHFT1qbFr2\/bWGDxywMzBLC4e1XXZIsDYzg7JMOpjCXwQ1iwUvmGI4pSvdxqxqh\/jnAXY09JTmbcxvtXEjH8yFlHbHG7ZmfUjWxYfGkBPUrysoyweBZ0icHJjbMfe4fq5XLns1QSN4kc\/ZehT47ofhnu84rfOG4jTGWNC+7SmPR26u89bOjIcs\/tDPHh4W80AgAyqg30uw64JQAAAABJRU5ErkJggg=='
	verify_icon_for_volume '-66' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAAM1BMVEUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACjBUbJAAAAEXRSTlMAz\/9AcIAg7xBQj2C\/n9+vMImzzagAAAF8SURBVHgB7JXbjoMwDAVPjiG3lsD\/f+1WFrWogQheV8xLsxKzE5lE4OHhvxAo2DGMEVdITBmOQqYBXezBCseLH95X4hP3G6\/ktXhOfMMjzcclpYg9o6Yd2eL2EGU3Zk3PQDee3\/yVE1u2\/xqBTjwmOrmQI5RMHs9GVJozSnIyZnvDMwMOybPGy2fh5Gjpl+17R9nEVQ7r0Cc22\/cLSjeu8vfFFrJ8Jz8dHTJr6sLtMrFCmXbnRAVrrgulrZI5A+lkGj5eGX4dOZF9XOxZ\/Y3fhRzLFh80XjPyOvbFnL6s8ahHtMlnIeb0ZWPaxHFT1qbFr2\/bWGDxywMzBLC4e1XXZIsDYzg7JMOpjCXwQ1iwUvmGI4pSvdxqxqh\/jnAXY09JTmbcxvtXEjH8yFlHbHG7ZmfUjWxYfGkBPUrysoyweBZ0icHJjbMfe4fq5XLns1QSN4kc\/ZehT47ofhnu84rfOG4jTGWNC+7SmPR26u89bOjIcs\/tDPHh4W80AgAyqg30uw64JQAAAABJRU5ErkJggg=='

	# muted 2 bars
	verify_icon_for_volume '-65' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAAY1BMVEUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABmaHTeAAAAIXRSTlMAU2YacIAgYAZQ\/+85v0CPTN8zEM9GDS2vJp8wfy8UWSLQfZGSAAABoElEQVR4Ae2Vh3qjMBAGf1MEWsXLcSK9vv9LXlnL+5GFKOJ6YdJjzzeAGnb+FXYOVY0FTetQQld1PQyeKDQowFXVBQwdfeFYEudqeeEDUVm876oPsPBo4xyCw5KPK2lEE2+JiKFMxJq+BLLxeKTXcqAxavoKyMRdICN7ojalq+oaa7BINxE+GBk3FFL6sjpglXgjcY94Y2Sn6Vu97gV+Fhd5Sg\/9jka97lvg3bjIgY7nu\/bnCc5rk0yaGtcXXHrgAwRezBMRUlPjwpiku3QJuK4qI5Ni4wNNp5VHBKFelZdxBsAiyU93lut1WeONxIeImB77vY5dXpa4kyk6MtzxJJXJwt0sjo2yNDVeftnKPTRe\/MAUBjReNlRG1jjwML01SZo3ZTxO9IXpHomL5TbmWBisPA4RrfzZwiyMJT4YmRxwr\/H8koSbXslRHrHGc5uBMKiszOJPzwfk8MHK\/KBx9DWyuMnII93M4u8xWNmXHUt66bNEdPZkyBMdsifDdm6vznFspq66lxRnbOW56vrTnYf4DbKTn5G3u+iv8OvY2fkMzwwjlCq76hwAAAAASUVORK5CYII='
	verify_icon_for_volume '-33' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAAY1BMVEUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABmaHTeAAAAIXRSTlMAU2YacIAgYAZQ\/+85v0CPTN8zEM9GDS2vJp8wfy8UWSLQfZGSAAABoElEQVR4Ae2Vh3qjMBAGf1MEWsXLcSK9vv9LXlnL+5GFKOJ6YdJjzzeAGnb+FXYOVY0FTetQQld1PQyeKDQowFXVBQwdfeFYEudqeeEDUVm876oPsPBo4xyCw5KPK2lEE2+JiKFMxJq+BLLxeKTXcqAxavoKyMRdICN7ojalq+oaa7BINxE+GBk3FFL6sjpglXgjcY94Y2Sn6Vu97gV+Fhd5Sg\/9jka97lvg3bjIgY7nu\/bnCc5rk0yaGtcXXHrgAwRezBMRUlPjwpiku3QJuK4qI5Ni4wNNp5VHBKFelZdxBsAiyU93lut1WeONxIeImB77vY5dXpa4kyk6MtzxJJXJwt0sjo2yNDVeftnKPTRe\/MAUBjReNlRG1jjwML01SZo3ZTxO9IXpHomL5TbmWBisPA4RrfzZwiyMJT4YmRxwr\/H8koSbXslRHrHGc5uBMKiszOJPzwfk8MHK\/KBx9DWyuMnII93M4u8xWNmXHUt66bNEdPZkyBMdsifDdm6vznFspq66lxRnbOW56vrTnYf4DbKTn5G3u+iv8OvY2fkMzwwjlCq76hwAAAAASUVORK5CYII='

	# muted 1 bar
	verify_icon_for_volume '-32' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6\/NlyAAACOklEQVR4Ae2ZIWjsQBCGV50LBN5TUcsT5453cDXnVp2qODgVV1V9XsWbeFWv6lW9ilfxKl6lezApy5LtLP03YUnng59CO6H8+SeT3awSfjeCIAiCIAjCzerVqlKJuFs1VlrlyQsZfvzcKZCr1UgayHxu6Idh0jnF3Rs9fWSYtnFMw63dTmYzTnvntPZzqjvYJ0jbWA0krdJyQlP2KcG0G+86g0xiJuWLAkDTLulvI2B4MlKTsZiUC0Wsmbam342gYXcSn5iUp7qDWgATMPRuVTqvtgExTFyY961fd1MLUZLBubSvbg1ouIhMeY+1dTzX+LSDhjtmghsyUke29V4ROaQ9Z3hwBiD3LOuIqW4Srrr4JJka7n\/oYA2\/jDTwIiRggE2SqZmjp7oWMHP46gSAkReetvO66wAz1XKG8bTNTIIjiTNTRNRUsGEg7Xsg7dapKZlJ\/ifGTHLDQNo6sNTsyaBbYxgz2Rqe9Baddoj8DfNJMjV5tTSgoyL4tPMfWqy8BNm0s30tAYZj0p54srotvfC4r2GY+G\/VzVzT0aPAcU71fUtbmYDaBIZ777ltAtc2agLfPOBbRNCwv3E48mnj20O0C7ofGi49swSfNv4BAKeNNhxPTNp\/rWpmqK3T4oDhiiZzbNo7ugYHaXHAcO19b+bTzoA2gWGd71EQ3+LRKVCLFsDhwLrwk3iFw4GNsbcq2LQ3QuWcSPxj0jZqA9SBIxg\/7cGq3JJh\/c2zbbZi1p3ggiAIgiAIQjZ8AoxZK6i4lrSOAAAAAElFTkSuQmCC'
	verify_icon_for_volume '-1' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6\/NlyAAACOklEQVR4Ae2ZIWjsQBCGV50LBN5TUcsT5453cDXnVp2qODgVV1V9XsWbeFWv6lW9ilfxKl6lezApy5LtLP03YUnng59CO6H8+SeT3awSfjeCIAiCIAjCzerVqlKJuFs1VlrlyQsZfvzcKZCr1UgayHxu6Idh0jnF3Rs9fWSYtnFMw63dTmYzTnvntPZzqjvYJ0jbWA0krdJyQlP2KcG0G+86g0xiJuWLAkDTLulvI2B4MlKTsZiUC0Wsmbam342gYXcSn5iUp7qDWgATMPRuVTqvtgExTFyY961fd1MLUZLBubSvbg1ouIhMeY+1dTzX+LSDhjtmghsyUke29V4ROaQ9Z3hwBiD3LOuIqW4Srrr4JJka7n\/oYA2\/jDTwIiRggE2SqZmjp7oWMHP46gSAkReetvO66wAz1XKG8bTNTIIjiTNTRNRUsGEg7Xsg7dapKZlJ\/ifGTHLDQNo6sNTsyaBbYxgz2Rqe9Baddoj8DfNJMjV5tTSgoyL4tPMfWqy8BNm0s30tAYZj0p54srotvfC4r2GY+G\/VzVzT0aPAcU71fUtbmYDaBIZ777ltAtc2agLfPOBbRNCwv3E48mnj20O0C7ofGi49swSfNv4BAKeNNhxPTNp\/rWpmqK3T4oDhiiZzbNo7ugYHaXHAcO19b+bTzoA2gWGd71EQ3+LRKVCLFsDhwLrwk3iFw4GNsbcq2LQ3QuWcSPxj0jZqA9SBIxg\/7cGq3JJh\/c2zbbZi1p3ggiAIgiAIQjZ8AoxZK6i4lrSOAAAAAElFTkSuQmCC'

	# muted 0 bars
	verify_icon_for_volume '-0' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6\/NlyAAACOUlEQVR4Ae2ZAYb7QBTGB4QihP8fBIxFgVK6UGBAQVECAgQUQI\/QG+QIe4Q9wh6hR+gRcoTs4GWNmr5+dl4Y2ffjg90p8+V782aSMcrfRlEURVEURWm8zl61EeLidfWyJk86Mtx5FSaRk9dIGsh8blivM2kv8fTGB31lmLYjwyKl3U9mM067CEr7KPUE7wJpO6+BJF0lO7GUiSox7evD71xqJ2ZSPhgY+bQr+t+YYHgy0pIxJOXSAEinbelvI2oY6MQ7LuVg3Gau7hgz9OlVBVvbkGKYOID77TSuMTNRkcFY2qdwTKLhEkx5LVrWDCc0bcZwQwmWL\/bbFixrb57IIG3HNKcjsJYt0NWd9KmLTZIZk1KOHXCMdOmHkIgBKEl+TIyWMYSa2fw8uAR4s3Jp75kui5qp5Q3Lpe34ybJmSmBMLW8YT\/vyJO0+GLPy6pjJ\/kPMiBtOSNs+OWrep7QpuSMz2ewNT\/pA0mZKNX\/DTJJo2vmXNKitIcC1nXvT4hUmiKSd2baUbhhMe+Ldq5n74HERN8xP+Bb5zS1YChx7qe9bliYaUy9guKXJrqKfhUj0dyP\/8iD3iggbjjSjLZ62\/OshWgW3XxoumM6Lpo1\/ABCmBwzj4Gn\/92r5pjZ3iacbrqkzo2kXKfuvbIkDhpm1fYDTzoBewLDN+yqIL3E+Bb6ZyV8FzUglPwngcmBhrL1KIO1FUAc3Em8v0nZmAbTMFUyY9uBVLcmwZda2W4jZoINnhKIoiqIoivINDkAfAMyszHAAAAAASUVORK5CYII='

	tear_down
}

@test 'icon appearance on status file read error' {
	set_up

	verify_icon_for_volume '' 'iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6\/NlyAAABpElEQVR4Ae2ZAYYDMRiFBwQYSoEBAwqUpWCAgAHFMiBAQQHsEfYGPdIeYY\/SI8ymBGGt9zTTJDbv47fYQb7+z59MpmsbIYQQQgghFl9XX0MrwpeHcPhrWhAeH8Khpq4RbBBuJtomiva5tk7cQ43dtpxq6\/KnrzUqmzKJQZfnkqI7X19BEgqDSeyCGNPlvmSEV14YTuIT6PI11LFwhIEwZo73W+K5pXSEU4V7ssuHONZlIswLL6GDPdhvHRnrQ8kIY2G8l46RzEhMdZt6Zl03LAviuAcTewJJSz6E3F8tHHBAiJE5Rj\/c06yZhCcwZRmZoUphuFj8\/554Zqhd2IDF7kmZ+oX5xUr4F4q0hlZ925JrZVtiDx7Lqw8eHwWOlvAHASk5b3Elav+o2wbCDix0yPPywPPu676B8B7E+ZL39RCn4PtJYeOrJy4ApgIXAJAbL0xhSZEZTPkMEU8XHsjuGvxcpognCjvyAu8IUpCVW5Iwnsx4yheO+FvHY4iOHWr9oLYDnUr\/mNYAU0ufS+MJPv9XSTzBGxAeG3AFE7wQQgghhBDiBwMUs5HKdLyOAAAAAElFTkSuQmCC'

	tear_down
}
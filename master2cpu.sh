#! /usr/bin/env bash

IS_OSX=$(uname -s | grep -i -c darwin)

if [[ "$IS_OSX" -ne "0" ]]; then
	SED=(sed -i "")
else
	SED=(sed -i)
fi

for argv in "$@"
do

	"${SED[@]}" 's|CRYPTOPP_BOOL_SSE2_ASM_AVAILABLE|CRYPTOPP_BOOL_SSE2_AVAILABLE|g' "$argv"
	"${SED[@]}" 's|CRYPTOPP_BOOL_SSE2_INTRINSICS_AVAILABLE|CRYPTOPP_BOOL_SSE2_AVAILABLE|g' "$argv"	
	"${SED[@]}" 's|CRYPTOPP_BOOL_NEON_INTRINSICS_AVAILABLE|CRYPTOPP_BOOL_NEON_AVAILABLE|g' "$argv"
	"${SED[@]}" 's|CRYPTOPP_BOOL_ARM_CRYPTO_INTRINSICS_AVAILABLE|CRYPTOPP_BOOL_ARM_CRYPTO_AVAILABLE|g' "$argv"
	"${SED[@]}" 's|CRYPTOPP_BOOL_ARM_CRC32_INTRINSICS_AVAILABLE|CRYPTOPP_BOOL_ARM_CRC32_AVAILABLE|g' "$argv"
	
	unix2dos --keepdate --quiet "$argv"
done

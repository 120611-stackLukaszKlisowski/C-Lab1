#!/usr/bin/env bash
set -u

APP="./build/app"
TEST_ROOT="tests"

scenario_total=0
scenario_pass=0
scenario_fail=0

compare_files() {
    local expected_file="$1"
    local actual_file="$2"
    local test_name="$3"

    local line_num=0
    local expected_line actual_line
    local expected_ok actual_ok
    local pass_count=0
    local fail_count=0
    local report=""

    exec 3<"$expected_file"
    exec 4<"$actual_file"

    while true; do
        if IFS= read -r expected_line <&3; then
            expected_ok=1
        else
            expected_ok=0
            expected_line=""
        fi

        if IFS= read -r actual_line <&4; then
            actual_ok=1
        else
            actual_ok=0
            actual_line=""
        fi

        if [[ $expected_ok -eq 0 && $actual_ok -eq 0 ]]; then
            break
        fi

        line_num=$((line_num + 1))

        if [[ "$expected_line" == "$actual_line" ]]; then
            pass_count=$((pass_count + 1))
        else
            fail_count=$((fail_count + 1))
            report+=$'----------\n'
            report+="Line: $line_num"$'\n'
            report+="Expected: $expected_line"$'\n'
            report+="Actual:   $actual_line"$'\n'
        fi
    done

    exec 3<&-
    exec 4<&-

    printf '[SCENARIO] %s\n' "$test_name"
    if [[ $fail_count -eq 0 ]]; then
        printf '[PASS] %d/%d\n' "$pass_count" "$((pass_count + fail_count))"
    else
        printf '[PASS] %d/%d\n' "$pass_count" "$((pass_count + fail_count))"
        printf '[FAIL] %d/%d\n' "$fail_count" "$((pass_count + fail_count))"
        printf '%s' "$report"
    fi

    if [[ $fail_count -eq 0 ]]; then
        return 0
    fi
    return 1
}

for case_dir in "$TEST_ROOT"/*; do
    [[ -d "$case_dir" ]] || continue

    input_file="$case_dir/input.txt"
    expected_file="$case_dir/expected.txt"
    actual_file="$case_dir/actual.txt"

    [[ -f "$expected_file" ]] || continue
    [[ -f "$input_file" ]] || : > "$input_file"

    scenario_total=$((scenario_total + 1))
    test_name="$(basename "$case_dir")"

    "$APP" < "$input_file" > "$actual_file"
    if compare_files "$expected_file" "$actual_file" "$test_name"; then
        scenario_pass=$((scenario_pass + 1))
    else
        scenario_fail=$((scenario_fail + 1))
    fi

    printf '==========\n\n'
done

printf '[SCENARIOS PASS] %d/%d\n' "$scenario_pass" "$scenario_total"
printf '[SCENARIOS FAIL] %d/%d\n' "$scenario_fail" "$scenario_total"

if (( scenario_fail > 0 )); then
    exit 1
fi

exit 0
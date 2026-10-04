# C-Lab1

![C](https://img.shields.io/badge/Language-C99-A8B9CC?style=flat&logo=c&logoColor=black)
![Linux](https://img.shields.io/badge/Target-Linux-FCC624?style=flat&logo=linux&logoColor=black)
![GitHub Codespaces](https://img.shields.io/badge/Environment-GitHub%20Codespaces-181717?style=flat&logo=github&logoColor=white)
![Educational](https://img.shields.io/badge/Purpose-Educational-6A5ACD?style=flat)

Pierwsze laboratorium z języka C, przygotowane do pracy w środowisku GitHub Codespaces.

## Cel laboratorium

Celem zajęć jest zapoznanie studenta z:

- podstawową strukturą programu w języku C,
- funkcją `main`,
- użyciem funkcji `printf`,
- deklarowaniem i inicjalizacją zmiennych,
- podstawowymi typami numerycznymi,
- typami całkowitymi ze znakiem i bez znaku,
- operatorami arytmetycznymi,
- budowaniem programu przy użyciu `make`,
- uruchamianiem oraz debugowaniem programu w GitHub Codespaces.

Laboratorium wprowadza typy całkowite `char`, `short`, `int`, `long` i `long long`, ich warianty `unsigned`, a także typy zmiennoprzecinkowe `float` i `double`.

## Struktura projektu

```text
.
├── .devcontainer/
│   └── devcontainer.json
├── .vscode/
│   ├── launch.json
│   └── tasks.json
├── src/
│   └── main.c
├── tests/
├── build/
├── Makefile
└── README.md
```

Najważniejsze elementy projektu:

- `src/main.c` — główny plik źródłowy programu; to plik edytowany przez studenta,
- `tests/` — katalog zawierający pliki pomocnicze związane z testami projektu,
- `Makefile` — plik sterujący budowaniem i uruchamianiem programu,
- `.vscode/launch.json` — konfiguracja uruchamiania oraz debugowania w VS Code,
- `.vscode/tasks.json` — konfiguracja zadań uruchamianych z poziomu VS Code,
- `.devcontainer/` — konfiguracja środowiska GitHub Codespaces,
- `build/` — katalog na pliki wynikowe kompilacji.

## Budowanie programu

Program można zbudować poleceniem:

```bash
make
```

Po poprawnej kompilacji plik wykonywalny zostanie utworzony w lokalizacji:

```text
build/app
```

Kompilacja wykorzystuje standard C99 oraz flagi diagnostyczne:

```text
-std=c99 -Wall -Wextra -Wpedantic -g
```

Znaczenie flag:

- `-std=c99` — użycie standardu C99,
- `-Wall` — włączenie podstawowych ostrzeżeń kompilatora,
- `-Wextra` — włączenie dodatkowych ostrzeżeń,
- `-Wpedantic` — ostrzeżenia o elementach niezgodnych ze standardem,
- `-g` — dodanie informacji potrzebnych podczas debugowania w GDB.

## Uruchamianie programu

Program można uruchomić z terminala:

```bash
make run
```

Polecenie buduje program, jeśli jest to konieczne, a następnie uruchamia plik `build/app`.

Program można także uruchamiać z poziomu VS Code / GitHub Codespaces przez zdefiniowane zadania w `.vscode/tasks.json`.

## Typy numeryczne

W języku C występują typy całkowite, zmiennoprzecinkowe oraz ich modyfikatory.

| Kategoria | Typy |
|---|---|
| Typy znakowe | `char`, `signed char`, `unsigned char` |
| Typy całkowite | `short`, `int`, `long`, `long long` |
| Typy całkowite bez znaku | `unsigned short`, `unsigned int`, `unsigned long`, `unsigned long long` |
| Typy zmiennoprzecinkowe | `float`, `double` |

Słowa `signed` i `unsigned` są modyfikatorami typów całkowitych.

Przykłady deklaracji:

```c
char character_value;
short short_value;
int integer_value;
long long_value;
long long long_long_value;

unsigned int unsigned_integer_value;
unsigned long unsigned_long_value;

float float_value;
double double_value;
```

Dokładny rozmiar typów `short`, `int`, `long` i `long long` zależy od platformy oraz implementacji kompilatora. Nie należy zakładać ich konkretnej liczby bajtów bez sprawdzenia. Do badania rozmiaru typu używa się operatora `sizeof`.

```c
printf("%zu\n", sizeof(short));
printf("%zu\n", sizeof(int));
printf("%zu\n", sizeof(long));
printf("%zu\n", sizeof(long long));
```

## Operatory arytmetyczne

W laboratorium wykorzystywane są następujące operatory:

| Operator | Znaczenie | Typy całkowite | `float` i `double` |
|---|---|---:|---:|
| `+` | Dodawanie | Tak | Tak |
| `-` | Odejmowanie | Tak | Tak |
| `*` | Mnożenie | Tak | Tak |
| `/` | Dzielenie | Tak | Tak |
| `%` | Reszta z dzielenia | Tak | Nie |

Operator `%` działa wyłącznie dla typów całkowitych.

Należy pamiętać o różnicy pomiędzy dzieleniem całkowitym i zmiennoprzecinkowym:

```c
int integer_result = 8 / 3;        /* wynik: 2 */
double real_result = 8.0 / 3.0;    /* wynik: około 2.666667 */
```

## Program startowy

Plik `src/main.c` zawiera na początku minimalny program wypisujący komunikat:

```text
Hello, World!
```

Program startowy służy wyłącznie do sprawdzenia, czy środowisko GitHub Codespaces, kompilator GCC, polecenie `make` oraz konfiguracja projektu działają poprawnie.

## Wzorce wyjścia programu

Poniższe fragmenty pokazują oczekiwany styl wypisywania wyników. Komentarze oznaczają miejsce, w którym należy umieścić właściwe wyrażenie arytmetyczne.
```c
printf("[typ] add: [modyfikator_typu]\n", [operand_1] + [operand_2]);
printf("[typ] sub: [modyfikator_typu]\n", [operand_1] - [operand_2]);
printf("[typ] mul: [modyfikator_typu]\n", [operand_1] * [operand_2]);
printf("[typ] div: [modyfikator_typu]\n", [operand_1] / [operand_2]);
printf("[typ] mod: [modyfikator_typu]\n", [operand_1] % [operand_20\]);
```



## Formaty `printf`

| Typ | Format `printf` |
|---|---|
| `char`, `signed char` | `%d` |
| `unsigned char` | `%u` |
| `short` | `%d` |
| `unsigned short` | `%u` |
| `int` | `%d` |
| `unsigned int` | `%u` |
| `long` | `%ld` |
| `unsigned long` | `%lu` |
| `long long` | `%lld` |
| `unsigned long long` | `%llu` |
| `float` | `%f` |
| `double` | `%f` |
| `sizeof(...)` | `%zu` |

Wartości `char` i `short` są promowane do `int` podczas przekazywania do `printf`, dlatego w tym przypadku używany jest format `%d`.
W przypadku `printf` wartości `float` są promowane do `double`, dlatego dla obu tych typów stosuje się format `%f`. Dla typów `float` oraz `double` należy zastosować specyfikator formatu `%.6f` zamiast `[modyfikator_typu]`. Oznacza to, że każdy wynik dla tych typów musi zostać wyświetlony z dokładnie sześcioma miejscami po przecinku.

Przykład:

```c
printf("float add: %.6f\n", float_a + float_b);
printf("double div: %.6f\n", double_a / double_b);
```

## Typy `unsigned`

Typy `unsigned` przechowują wyłącznie wartości nieujemne. W zamian oferują większy zakres wartości dodatnich niż odpowiadające im typy ze znakiem o tej samej szerokości.

Przykład:

```c
unsigned int value = 0U;
value = value - 1U;
```

Wynikiem nie będzie `-1`. Nastąpi przejście do największej wartości możliwej dla typu `unsigned int`.


## Debugowanie

Program można debugować w VS Code / GitHub Codespaces przez panel **Run and Debug**.

Podstawowa procedura:

1. Otwórz panel **Run and Debug**.
2. Wybierz konfigurację debugowania programu C.
3. Ustaw breakpoint w pliku `src/main.c`.
4. Naciśnij `F5`.
5. Wykonuj program krokowo i obserwuj wartości zmiennych.

Podczas debugowania warto zwrócić uwagę na:

- wartości zmiennych różnych typów,
- różnicę pomiędzy dzieleniem całkowitym a zmiennoprzecinkowym,
- wynik działania operatora `%`,
- sposób reprezentacji wartości `unsigned`,
- wartości przekazywane do `printf`.

## Zadania

1. Uruchom program startowy, który wypisuje komunikat `Hello, World!`.

2. Zastąp program `Hello, World!` programem docelowym opisanym poniżej. Po zakończeniu zadania program nie powinien wypisywać komunikatu `Hello, World!`.

3. Zdefiniuj i zainicjalizuj po dwie zmienne każdego z następujących typów:

   - `char`
   - `short`
   - `int`
   - `long`
   - `long long`
   - `float`
   - `double`
   - `unsigned char`

4. Dla każdego typu użyj wartości odpowiadających liczbom `20` oraz `6`.

5. Dla typów całkowitych: `char`, `short`, `int`, `long`, `long long` oraz `unsigned char`, wykonaj i wyświetl wyniki w następującej kolejności:

   1. dodawanie,
   2. odejmowanie,
   3. mnożenie,
   4. dzielenie całkowite,
   5. reszta z dzielenia.

6. Dla typów zmiennoprzecinkowych: `float` oraz `double`, wykonaj i wyświetl wyniki w następującej kolejności:

   1. dodawanie,
   2. odejmowanie,
   3. mnożenie,
   4. dzielenie.

7. Wyniki dla typów należy wyświetlić **dokładnie w tej kolejności**:

   1. `char`
   2. `short`
   3. `int`
   4. `long`
   5. `long long`
   6. `float`
   7. `double`
   8. `unsigned char`

8. Każdy wynik wypisz w osobnej linii. Nie wypisuj dodatkowych komunikatów, nagłówków, pustych linii ani tekstu `Hello, World!`.
9. Porównaj wyniki dzielenia całkowitego i zmiennoprzecinkowego:
10. Wyświetl rozmiary wszystkich użytych typów za pomocą operatora `sizeof`.
11. Zastosuj znacznie większe lub mniejsze wartości dla typów 'char' i 'unsigned char'. Napisz z czego wynika zachowanie programu.

_Last updated: 2026-10-04_
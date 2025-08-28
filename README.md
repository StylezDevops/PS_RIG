
# PowerShell Random Insult Generator

A little PowerShell script that generates random insults in the format:

```

yer mum \[does something ridiculous]

````

Example outputs:
- `yer dad argues with a Greggs sausage roll at the darts`
- `yer nan takes selfies with the gas meter`
- `yer mum licks a traffic cone outside Sports Direct`

---

## Features

- **Prefix pool**: `yer mum`, `yer dad`, `yer nan` (easy to extend with more characters).
- **Original endings**: Hand-crafted insults with placeholders like `{poss}`, `{obj}`, and `{pronoun}`.
- **Dynamic generation**: New insults built from three randomised pools:
  - **Verbs** (e.g. *licks*, *argues with*, *saves receipts for*).
  - **Objects** (e.g. *a traffic cone*, *a Greggs sausage roll*, *a VHS rewinder*).
  - **Contexts** (e.g. *at Wetherspoons*, *outside Aldi*, *on the Megabus*).
- **Unlimited combinations**: The script flips a coin — sometimes picking an original ending, sometimes building a fresh insult.

---

## Usage

Clone or download the repo, then run the script in PowerShell:

```powershell
.\insult-generator.ps1
````

Press **Enter** to generate the next insult.
Press **Ctrl+C** to quit.

---

## Customisation

* Add more characters in `$prefixes` (with their gender for correct pronouns).
* Expand `$endings`, `$verbs`, `$objects`, and `$contexts` with your own ideas.
* Tweak the randomisation balance (currently 50/50 between original endings and generated ones).

---

## Example Output

```
yer dad shouts at a karaoke machine in Greggs
yer mum irons crisps
yer nan does karaoke with a lava lamp on Blackpool pier
```

---

## License

MIT - free to use, remix, and make yer own daft insults.


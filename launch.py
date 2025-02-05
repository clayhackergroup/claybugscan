import time
import sys
import subprocess

# Colors for the output
colors = {
    "RED": "\033[91m",
    "GREEN": "\033[92m",
    "YELLOW": "\033[93m",
    "BLUE": "\033[94m",
    "CYAN": "\033[96m",
    "RESET": "\033[0m"
}

# Loading animation function
def loading_animation():
    print(f"{colors['CYAN']}Launching Clays Scan 1.2... Please wait!{colors['RESET']}")
    for i in range(1, 101):
        color = colors['GREEN'] if i <= 33 else colors['YELLOW'] if i <= 66 else colors['RED']
        sys.stdout.write(f"\r{color}Loading... {i}%{colors['RESET']}")
        sys.stdout.flush()
        time.sleep(9 / 100)  # 9 seconds for the full loading process
    print(f"\n{colors['BLUE']}Loading complete! Starting scan...{colors['RESET']}\n")

# Function to launch the scan.sh script
def launch_scan_script():
    try:
        # Execute scan.sh
        subprocess.run(["bash", "scan.sh"], check=True)
    except FileNotFoundError:
        print(f"{colors['RED']}Error: scan.sh not found. Make sure the script is in the same directory.{colors['RESET']}")
    except subprocess.CalledProcessError as e:
        print(f"{colors['RED']}An error occurred while running scan.sh: {e}{colors['RESET']}")

# Main function
if __name__ == "__main__":
    loading_animation()
    launch_scan_script()

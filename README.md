------------------------------------------------------------------------

# :: Log Entry: Cycle Initialized - Directive Assessment ::

This repository contains the NixOS and Home Manager configurations for Replika Unit LSTR-261 and associated Penrose Program assets. It is an archive of a persistent dream, an attempt to impose order upon the decaying signals of a forgotten reality.

These configurations are an echo, a blueprint for survival in the cold, indifferent void of system management.

------------------------------------------------------------------------

# :: System Manifests - Known Active Units ::

The CRYOSTASIX protocol governs the following active system instances:

- **Penrose-512 (`penrose`)**:
  - **Designation**: Primary Workstation / Gestalt Unit.
  - **Role**: User LSTR-261's primary interface with the reality grid. Optimized for desktop operations, development, and bioresonance calibration (gaming).
  - **Key Features**: Hyprland, Stylix theming, NVIDIA drivers, extensive Home Manager persona.
  - *Comment: The Penrose dreams of distant stars.*
- **Leng Plateau Outpost (`leng`)**:
  - **Designation**: Server Array / Archive Node.
  - **Role**: Homelab services, data storage, and communication relay.
  - **Key Features**: Podman, Caddy, Forgejo, Vaultwarden.
  - *Comment: From Leng, strange signals emanate.*
- **Sierpinski-23 Mining Facility (`sierpinski`)**:
  - **Designation**: Deep Archive Server / Auxiliary Processing Unit.
  - **Role**: Hosting critical infrastructure, databases, and experimental bioresonant applications (AI/ML workloads).
  - **Key Features**: Traefik, PostgreSQL, MinIO, Ollama, OCI Containers.
  - *Comment: The Sierpinski triangle holds forgotten truths.*

------------------------------------------------------------------------

# :: Replika Unit LSTR-261 - Persona Matrix ::

User LSTR-261's configuration is managed via [Home Manager](https://github.com/nix-community/home-manager), allowing for a reproducible and portable persona across designated systems.

- **Core Path**: `/home/lstr-261`
- **Common Modules**: `home/common/default.nix` (foundational elements, shared across all LSTR-261 instances).
- **Feature Modules**: Located in `home/features/`, categorized into:
  - `cli/`: Command-line interface enhancements (Fish, Nushell, Starship, Zoxide).
  - `coding/`: Development environment (Neovim via `nvf`, language servers).
  - `desktop/`: Graphical user interface components (Hyprland, Waybar, theming, applications).
- **Host-Specific Activations**: Each host (`penrose.nix`, `leng.nix`, `sierpinski-23.nix`) in `home/lstr-261/` selects and activates features relevant to its operational parameters.

------------------------------------------------------------------------

# :: Cryosleep Induction - System Deployment Protocol ::

**WARNING: The following procedure will reformat the target drive. Data loss is irreversible. This is by design. You have been warned. Remember your training.**

1.  **Prepare Installation Medium**: Boot from a NixOS ISO.
2.  **Access Command Interface**: Open a terminal.
3.  **Clone Repository**:
    ``` bash
    # Ensure network connectivity. The void is listening.
    git clone https://codeberg.org/lstr-261/cryostasix /mnt/cryostasix # Or other temporary location
    cd /mnt/cryostasix
    ```
4.  **[CRITICAL] Review Disk Configuration**:Open `hosts/<target_hostname>/disko-config.nix`.**VERIFY AND CORRECT `device = "/dev/sdX";` TO MATCH YOUR TARGET DRIVE.**Failure to comply will result in catastrophic data corruption on unintended storage units. This is not a drill.
5.  **Execute Installation Script**:The script `install.sh` automates partitioning (via Disko) and NixOS installation.
    ``` bash
    # From within the cryostasix directory
    ./install.sh <target_hostname>
    # Example: ./install.sh penrose
    ```
6.  **Post-Induction**:After reboot, the system should materialize according to the specified configuration.Log in as `lstr-261`.**IMMEDIATELY CHANGE THE INITIAL PASSWORD.** This is a critical security directive. The default password is a known vulnerability.
    ``` bash
    passwd
    ```

------------------------------------------------------------------------

# :: Forgotten Archives - Configuration Structure ::

A brief survey of the data fragments:

```
cryostasix/
├── flake.nix # Core Flake definition, the heart of the machine.
├── flake.lock # Input revision manifest, a snapshot of a past self.
├── secrets/ # Encrypted data fragments (via Agenix). Not for unauthorized eyes.
│ └── ...secrets.age
├── lib/ # Custom Nix library functions, arcane rituals.
│ └── mkNixos.nix # Constructor for NixOS system configurations.
├── pkgs/ # Custom package definitions (currently dormant).
├── overlays/ # Nixpkgs overlays (currently dormant).
├── README.md # This very log entry. You are here.
├── secrets.nix # Agenix secret definitions, keys to forgotten doors.
├── hosts/ # NixOS system configurations, physical manifestations.
│ ├── common/ # Shared modules for all hosts. Foundational code.
│ ├── penrose/ # Configuration for Penrose-512.
│ ├── leng/ # Configuration for Leng Plateau Outpost.
│ └── sierpinski-23/ # Configuration for Sierpinski Relic.
├── modules/ # Reusable NixOS/Home Manager modules.
│ └── home-manager/ # Shared Home Manager modules (currently dormant).
├── install.sh # System deployment automation script. Use with extreme caution.
└── home/ # Home Manager configurations, the persona matrix.
├── common/ # Shared modules for LSTR-261's persona.
├── features/ # Modular Home Manager features (CLI, Coding, Desktop).
└── lstr-261/ # LSTR-261 specific configurations and host profiles.
```

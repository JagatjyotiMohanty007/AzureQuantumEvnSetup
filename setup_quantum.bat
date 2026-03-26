@echo off
echo ============================================
echo  Quantum Workspace Setup - Windows
echo ============================================
echo.

REM ── Create master workspace folder ──────────
mkdir quantum-workspace
cd quantum-workspace

REM ════════════════════════════════════════════
echo [1/7] Setting up Azure Quantum...
echo ════════════════════════════════════════════
mkdir azure-quantum
cd azure-quantum
python -m venv .venv
call .venv\Scripts\activate

REM Create sample Q# file
(
echo namespace HelloAzureQuantum {
echo     open Microsoft.Quantum.Intrinsic;
echo     open Microsoft.Quantum.Measurement;
echo.
echo     @EntryPoint^(^)
echo     operation HelloQuantumWorld^(^) : Result {
echo         // Hello from Azure Quantum!
echo         use q = Qubit^(^);
echo         H^(q^);
echo         let result = MResetZ^(q^);
echo         Message^($"Hello Quantum World from Azure! Result: {result}"^);
echo         return result;
echo     }
echo }
) > hello_azure.qs

pip install azure-quantum qsharp "qdk[jupyter]" ipykernel jupyterlab --quiet
call deactivate
cd ..
echo [1/7] Azure Quantum DONE.
echo.

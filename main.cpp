#include <iostream>
#include <windows.h>

// Declaring the external assembly function
extern "C" void* GetFunctionAddress(const char* functionName);

int main() {
    const char* functionName = "OpenProcess";

    // Calling the assembly function
    void* functionAddr = GetFunctionAddress(functionName);

    if (functionAddr != nullptr) {
        std::cout << functionName << " function address: " << functionAddr << std::endl;
    } else {
        std::cout << "Failed to find the " << functionName << " function address." << std::endl;
    }

    return 0;
}

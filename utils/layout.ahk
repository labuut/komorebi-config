#Include %A_ScriptDir%


getLayoutName(layoutIndex) {
  return LAYOUTS[layoutIndex]
}

getLayoutIndex() {
  return LAYOUT_INDEX
}

setLayoutIndex(layoutIndex) {
    LAYOUT_INDEX := layoutIndex
}

; in circle
calculateNextLayoutIndex() {
  currentLayoutIndex := getLayoutIndex()

  nextLayoutIndex := Mod(currentLayoutIndex + 1, LAYOUTS.Length()) + 1

  return nextLayoutIndex
}

changeLayout() {
  nextLayoutIndex := calculateNextLayoutIndex()

  setLayoutIndex(nextLayoutIndex)
  
  layoutName := getLayoutName(nextLayoutIndex)

  Run, komorebic.exe change-layout %layoutName%, , Hide return
}
local main = {}

function main:Begin(PROPS) 
    if not PROPS then 
        return
    end

    warn("This is an alpha release of imgui-rbx, expect way more elements being added in later updates! cya");
    warn("(also expect some bugs)");

    local MenuOptions = PROPS or {
        Name = PROPS.Name or "imgui-rbx | alpha 0.1",
        Width = PROPS.Width or 574,
        Height = PROPS.Height or 350
    }

    local function SecureGui(gui_element)
        if syn.protect_gui then 
            syn.protect_gui(gui_element)
            gui_element.Parent = game:GetService("CoreGui")
        elseif gethui then
            gui_element.Parent = gethui()
        else
            error("Cannot secure GUI, it's unsafe to continue.");
            gui_element.Parent = game:GetService("Players").LocalPlayer.PlayerGui
        end
    end

    local function GetFont() 
        return Font.fromId(12187374954)
    end

    local ImGui = Instance.new("ScreenGui")
    local Window = Instance.new("Frame")
    local WindowCorner = Instance.new("UICorner")
    local WindowPanel = Instance.new("Frame")
    local WindowPanelIcon = Instance.new("ImageLabel")
    local MinimiseButton = Instance.new("TextButton")
    local MinimiseButtonIcon = Instance.new("ImageLabel")
    local WindowPanelIconPadding = Instance.new("UIPadding")
    local WindowDisplayName = Instance.new("TextLabel")
    local WindowDisplayNamePadding = Instance.new("UIPadding")
    local ResizeAll = Instance.new("TextButton")
    local ResizeAllIcon = Instance.new("ImageLabel")
    local WindowElementContainer = Instance.new("Frame")
    local WindowElements = Instance.new("ScrollingFrame")
    local WindowElementsLayout = Instance.new("UIListLayout")
    local WindowElementsPadding = Instance.new("UIPadding")
    
    local WindowElementsContainerLayout = Instance.new("UIListLayout")
    local AWindowSep = Instance.new("Frame")

    ImGui.Name = string.format("ImGui-%s", tostring(syn.crypt.base64.encode(game:GetService("Players").LocalPlayer.UserId)))
    ImGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ImGui.ResetOnSpawn = false
    SecureGui(ImGui)

    Window.Name = "Window"
    Window.Parent = ImGui
    Window.Active = true
    Window.BackgroundColor3 = Color3.fromRGB(21, 22, 23)
    Window.BackgroundTransparency = 0.050
    Window.ClipsDescendants = true
    Window.Position = UDim2.new(0.283211678, 0, 0.155285195, 0)
    Window.Selectable = true
    Window.Size = UDim2.new(0, MenuOptions.Width, 0, MenuOptions.Height)

    WindowCorner.CornerRadius = UDim.new(0, 9)
    WindowCorner.Name = "WindowCorner"
    WindowCorner.Parent = Window

    WindowPanel.Name = "WindowPanel"
    WindowPanel.Parent = Window
    WindowPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowPanel.BackgroundTransparency = 1.000
    WindowPanel.Size = UDim2.new(1, 0, 0, 25)
    WindowPanel.ZIndex = 2

    WindowPanelIcon.Name = "WindowPanelIcon"
    WindowPanelIcon.Parent = WindowPanel
    WindowPanelIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    WindowPanelIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowPanelIcon.BackgroundTransparency = 1.000
    WindowPanelIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    WindowPanelIcon.Size = UDim2.new(0.999999881, 0, 1, 0)
    WindowPanelIcon.ZIndex = 2
    WindowPanelIcon.Image = "rbxassetid://13034670565"
    WindowPanelIcon.ScaleType = Enum.ScaleType.Tile

    MinimiseButton.Name = "MinimiseButton"
    MinimiseButton.Parent = WindowPanelIcon
    MinimiseButton.AnchorPoint = Vector2.new(0.5, 0.5)
    MinimiseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MinimiseButton.BackgroundTransparency = 1.000
    MinimiseButton.Position = UDim2.new(0, 13, 0.5, 0)
    MinimiseButton.Size = UDim2.new(0.0452961661, 0, 1, 0)
    MinimiseButton.FontFace = GetFont()
    MinimiseButton.Text = ""
    MinimiseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    MinimiseButton.TextSize = 14.000

    MinimiseButtonIcon.Name = "MinimiseButtonIcon"
    MinimiseButtonIcon.Parent = MinimiseButton
    MinimiseButtonIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    MinimiseButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MinimiseButtonIcon.BackgroundTransparency = 1.000
    MinimiseButtonIcon.Position = UDim2.new(0.5, 0, 0.5, 2)
    MinimiseButtonIcon.Size = UDim2.new(0, 12, 0, 12)
    MinimiseButtonIcon.Image = "rbxassetid://13034875812"

    WindowPanelIconPadding.Name = "WindowPanelIconPadding"
    WindowPanelIconPadding.Parent = WindowPanelIcon
    WindowPanelIconPadding.PaddingLeft = UDim.new(0, 2)

    WindowDisplayName.Name = "WindowDisplayName"
    WindowDisplayName.Parent = WindowPanelIcon
    WindowDisplayName.AnchorPoint = Vector2.new(0.5, 0.5)
    WindowDisplayName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowDisplayName.BackgroundTransparency = 1.000
    WindowDisplayName.Position = UDim2.new(0.5, 0, 0.5, 0)
    WindowDisplayName.Size = UDim2.new(1, 0, 1, 0)
    WindowDisplayName.FontFace = Font.fromId(12187362578)
    WindowDisplayName.Text = PROPS.Name
    WindowDisplayName.TextColor3 = Color3.fromRGB(225, 225, 225)
    WindowDisplayName.TextSize = 16.000
    WindowDisplayName.TextXAlignment = Enum.TextXAlignment.Left

    WindowDisplayNamePadding.Name = "WindowDisplayNamePadding"
    WindowDisplayNamePadding.Parent = WindowDisplayName
    WindowDisplayNamePadding.PaddingLeft = UDim.new(0, 30)

    ResizeAll.Name = "ResizeAll"
    ResizeAll.Parent = Window
    ResizeAll.AnchorPoint = Vector2.new(0.5, 0.5)
    ResizeAll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ResizeAll.BackgroundTransparency = 1.000
    ResizeAll.BorderSizePixel = 0
    ResizeAll.Position = UDim2.new(0, 563, 0, 339)
    ResizeAll.Size = UDim2.new(0, 22, 0, 22)
    ResizeAll.FontFace = GetFont()
    ResizeAll.Text = ""
    ResizeAll.TextColor3 = Color3.fromRGB(0, 0, 0)
    ResizeAll.TextSize = 14.000
    ResizeAll.ZIndex = 2

    ResizeAllIcon.Name = "ResizeAllIcon"
    ResizeAllIcon.Parent = ResizeAll
    ResizeAllIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    ResizeAllIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ResizeAllIcon.BackgroundTransparency = 1.000
    ResizeAllIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    ResizeAllIcon.Size = UDim2.new(1.06818187, 0, 1, 0)
    ResizeAllIcon.ZIndex = -1
    ResizeAllIcon.Image = "rbxassetid://13034819689"

    WindowElementContainer.Name = "WindowElementContainer"
    WindowElementContainer.Parent = Window
    WindowElementContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowElementContainer.BackgroundTransparency = 1.000
    WindowElementContainer.Size = UDim2.new(1, 0, 1, 0)

    WindowElements.Name = "WindowElements"
    WindowElements.Parent = WindowElementContainer
    WindowElements.Active = true
    WindowElements.AnchorPoint = Vector2.new(0.5, 0.5)
    WindowElements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowElements.BackgroundTransparency = 1.000
    WindowElements.BorderSizePixel = 0
    WindowElements.Position = UDim2.new(0.5, 0, 0.54285717, 0)
    WindowElements.Size = UDim2.new(1, -5, 0.914285719, 0)
    WindowElements.CanvasSize = UDim2.new(0, 0, 0, 0)
    WindowElements.ScrollBarThickness = 10

    WindowElementsLayout.Name = "WindowElementsLayout"
    WindowElementsLayout.Parent = WindowElements
    WindowElementsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    WindowElementsLayout.Padding = UDim.new(0, 6)

    WindowElementsPadding.Name = "WindowElementsPadding"
    WindowElementsPadding.Parent = WindowElements
    WindowElementsPadding.PaddingBottom = UDim.new(0, 15)
    WindowElementsPadding.PaddingLeft = UDim.new(0, 7)
    WindowElementsPadding.PaddingRight = UDim.new(0, 20)
    WindowElementsPadding.PaddingTop = UDim.new(0, 10)

    WindowElementsContainerLayout.Name = "WindowElementsContainerLayout"
    WindowElementsContainerLayout.Parent = WindowElementContainer
    WindowElementsContainerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    AWindowSep.Name = "AWindowSep"
    AWindowSep.Parent = WindowElementContainer
    AWindowSep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    AWindowSep.BackgroundTransparency = 1.000
    AWindowSep.Position = UDim2.new(0.00609756075, 0, 0, 0)
    AWindowSep.Size = UDim2.new(0, 567, 0, 25)

    local ElementHandler = {}

    function ElementHandler:Text(TextDisplay) 
        local Label_Element = Instance.new("TextLabel")

        Label_Element.Name = "Label_Element"
        Label_Element.Parent = WindowElements
        Label_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label_Element.BackgroundTransparency = 1.000
        Label_Element.Size = UDim2.new(1, 0, 0, 20)
        Label_Element.FontFace = GetFont()
        Label_Element.Text = TextDisplay
        Label_Element.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label_Element.TextSize = 17.000
        Label_Element.TextXAlignment = Enum.TextXAlignment.Left
    end

    function ElementHandler:Button(TextDisplay) 
        local Button_Element = Instance.new("TextButton")
        local Button_ElementPadding = Instance.new("UIPadding")
        local OnClick = {}

        Button_Element.Name = "Button_Element"
        Button_Element.Parent = WindowElements
        Button_Element.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
        Button_Element.BorderColor3 = Color3.fromRGB(74, 74, 83)
        Button_Element.Position = UDim2.new(0, 0, 0.0833333358, 0)
        Button_Element.Size = UDim2.new(0, 21, 0, 23)
        Button_Element.FontFace = GetFont()
        Button_Element.Text = TextDisplay
        Button_Element.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button_Element.TextSize = 17.000

        Button_ElementPadding.Name = "Button_ElementPadding"
        Button_ElementPadding.Parent = Button_Element
        Button_ElementPadding.PaddingLeft = UDim.new(0, 6)
        Button_ElementPadding.PaddingRight = UDim.new(0, 6)

        function OnClick:Connect(Function) 
            Button_Element.MouseButton1Click:Connect(Function)
        end
                
        local box = Button_Element
        local text = box.Text

        local size = box.TextBounds.X
        
        if game:IsLoaded() then box.Size = UDim2.new(0, size + 20, 0, 23) end

        return OnClick
    end

    function ElementHandler:InputText(InputTextOptions) 
        local TextBox_Element = Instance.new("Frame")
        local TextBox_ElementName = Instance.new("TextLabel")
        local TextBox_ElementLayout = Instance.new("UIListLayout")
        local TextBox_ElementInput = Instance.new("TextBox")
        local TextBox_ElementInputPadding = Instance.new("UIPadding")

        TextBox_Element.Name = "TextBox_Element"
        TextBox_Element.Parent = WindowElements
        TextBox_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextBox_Element.BackgroundTransparency = 1.000
        TextBox_Element.Size = UDim2.new(1, 0, 0, 23)

        TextBox_ElementName.Name = "TextBox_ElementName"
        TextBox_ElementName.Parent = TextBox_Element
        TextBox_ElementName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextBox_ElementName.BackgroundTransparency = 1.000
        TextBox_ElementName.Position = UDim2.new(2.21000004, 0, 0, 0)
        TextBox_ElementName.Size = UDim2.new(1, 0, 0.0299999993, 20)
        TextBox_ElementName.FontFace = GetFont()
        TextBox_ElementName.Text = InputTextOptions.Name
        TextBox_ElementName.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox_ElementName.TextSize = 17.000
        TextBox_ElementName.TextXAlignment = Enum.TextXAlignment.Left

        TextBox_ElementLayout.Name = "TextBox_ElementLayout"
        TextBox_ElementLayout.Parent = TextBox_Element
        TextBox_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
        TextBox_ElementLayout.Padding = UDim.new(0, 7)

        TextBox_ElementInput.Name = "TextBox_ElementInput"
        TextBox_ElementInput.Parent = TextBox_Element
        TextBox_ElementInput.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
        TextBox_ElementInput.BorderColor3 = Color3.fromRGB(74, 74, 83)
        TextBox_ElementInput.ClipsDescendants = true
        TextBox_ElementInput.Size = UDim2.new(0.300000012, 0, 1, 0)
        TextBox_ElementInput.ClearTextOnFocus = false
        TextBox_ElementInput.FontFace = GetFont()
        TextBox_ElementInput.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        TextBox_ElementInput.ShowNativeInput = false
        TextBox_ElementInput.Text = ""
        TextBox_ElementInput.TextColor3 = Color3.fromRGB(221, 221, 221)
        TextBox_ElementInput.TextSize = 16.000
        TextBox_ElementInput.TextXAlignment = Enum.TextXAlignment.Left

        TextBox_ElementInputPadding.Name = "TextBox_ElementInputPadding"
        TextBox_ElementInputPadding.Parent = TextBox_ElementInput
        TextBox_ElementInputPadding.PaddingLeft = UDim.new(0, 5)
        TextBox_ElementInputPadding.PaddingRight = UDim.new(0, 5)

        TextBox_ElementInput.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
            if enterPressed then
                pcall(InputTextOptions.Callback, TextBox_ElementInput.Text)
            end
        end)
                
        
    end

    function ElementHandler:SliderFloat(SliderOptions) 
        local Slider_Element = Instance.new("Frame")
        local Slider_ElementFrame = Instance.new("Frame")
        local Slider_ElementSelector = Instance.new("Frame")
        local Slider_ElementValue = Instance.new("TextLabel")
        local Slider_ElementOnInput = Instance.new("TextButton")
        local Slider_ElementName = Instance.new("TextLabel")
        local Slider_ElementLayout = Instance.new("UIListLayout")

        Slider_Element.Name = "Slider_Element"
        Slider_Element.Parent = WindowElements
        Slider_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_Element.BackgroundTransparency = 1.000
        Slider_Element.Size = UDim2.new(1, 0, 0, 23)

        Slider_ElementFrame.Name = "Slider_ElementFrame"
        Slider_ElementFrame.Parent = Slider_Element
        Slider_ElementFrame.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
        Slider_ElementFrame.BorderColor3 = Color3.fromRGB(74, 74, 83)
        Slider_ElementFrame.ClipsDescendants = true
        Slider_ElementFrame.Size = UDim2.new(0.300000012, 0, -3.34800005, 100)

        Slider_ElementSelector.Name = "Slider_ElementSelector"
        Slider_ElementSelector.Parent = Slider_ElementFrame
        Slider_ElementSelector.AnchorPoint = Vector2.new(0.5, 0.5)
        Slider_ElementSelector.BackgroundColor3 = Color3.fromRGB(70, 128, 209)
        Slider_ElementSelector.BackgroundTransparency = 0.150
        Slider_ElementSelector.BorderSizePixel = 0
        Slider_ElementSelector.Position = UDim2.new(0, 10, 0.5, 0)
        Slider_ElementSelector.Size = UDim2.new(0, 13, 0, 21)

        Slider_ElementValue.Name = "Slider_ElementValue"
        Slider_ElementValue.Parent = Slider_ElementFrame
        Slider_ElementValue.AnchorPoint = Vector2.new(0.5, 0.5)
        Slider_ElementValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementValue.BackgroundTransparency = 1.000
        Slider_ElementValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        Slider_ElementValue.Size = UDim2.new(1, 0, 1, 0)
        Slider_ElementValue.FontFace = GetFont()
        Slider_ElementValue.LineHeight = 0.930
        Slider_ElementValue.Text = SliderOptions.Default
        Slider_ElementValue.TextColor3 = Color3.fromRGB(217, 217, 217)
        Slider_ElementValue.TextSize = 17.000

        Slider_ElementOnInput.Name = "Slider_ElementOnInput"
        Slider_ElementOnInput.Parent = Slider_ElementFrame
        Slider_ElementOnInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementOnInput.BackgroundTransparency = 1.000
        Slider_ElementOnInput.Size = UDim2.new(1, 0, 1, 0)
        Slider_ElementOnInput.FontFace = GetFont()
        Slider_ElementOnInput.Text = ""
        Slider_ElementOnInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        Slider_ElementOnInput.TextSize = 14.000

        Slider_ElementName.Name = "Slider_ElementName"
        Slider_ElementName.Parent = Slider_Element
        Slider_ElementName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementName.BackgroundTransparency = 1.000
        Slider_ElementName.Position = UDim2.new(2.21000004, 0, 0, 0)
        Slider_ElementName.Size = UDim2.new(1, 0, 0.0299999993, 20)
        Slider_ElementName.FontFace = GetFont()
        Slider_ElementName.Text = SliderOptions.Name
        Slider_ElementName.TextColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementName.TextSize = 17.000
        Slider_ElementName.TextXAlignment = Enum.TextXAlignment.Left

        Slider_ElementLayout.Name = "Slider_ElementLayout"
        Slider_ElementLayout.Parent = Slider_Element
        Slider_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
        Slider_ElementLayout.Padding = UDim.new(0, 7)

        local UserInputService = game:GetService("UserInputService")

        local minValue = SliderOptions.Min
        local maxValue = SliderOptions.Max
        local decimalPlaces = 3
        local defaultValue = SliderOptions.Default

        local function updateSlider(input)
            local sliderWidth = Slider_ElementOnInput.AbsoluteSize.X - 10
            local sliderPosition = math.clamp(input.Position.X - (Slider_ElementOnInput.AbsolutePosition.X + 5), 0, sliderWidth) / sliderWidth
            local sliderValue = minValue + (maxValue - minValue) * sliderPosition

            -- Check if the slider selector has reached the start of the slider
            if sliderPosition <= 0 then
                sliderPosition = 0
                sliderValue = minValue
                -- Check if the slider selector has reached the end of the slider
            elseif sliderPosition >= 1 then
                sliderPosition = 1
                sliderValue = maxValue
            else
                -- The slider is in the middle of the track, so update the slider value accordingly
                sliderValue = minValue + (maxValue - minValue) * sliderPosition
            end

            Slider_ElementValue.Text = string.format("%."..decimalPlaces.."f", sliderValue)
            Slider_ElementSelector.Position = UDim2.new(sliderPosition, 0, 0.5, 0)

            pcall(SliderOptions.OnChanged, sliderValue)
        end

        local function setSliderValue(value)
            value = math.clamp(value, minValue, maxValue)
            local sliderPosition = (value - minValue) / (maxValue - minValue)
            Slider_ElementValue.Text = string.format("%."..decimalPlaces.."f", value)
            Slider_ElementSelector.Position = UDim2.new(sliderPosition, 0, 0.5, 0)
        end

        setSliderValue(defaultValue)

        local dragging = false

        Slider_ElementOnInput.MouseButton1Down:Connect(function()
            dragging = true
        end)

        Slider_ElementOnInput.MouseButton1Up:Connect(function()
            dragging = false
        end)

        Slider_ElementFrame.MouseLeave:Connect(function() 
            dragging = false
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                updateSlider(input)
            end
        end)
    end

    function ElementHandler:SliderInteger(SliderOptions) 
        local Slider_Element = Instance.new("Frame")
        local Slider_ElementFrame = Instance.new("Frame")
        local Slider_ElementSelector = Instance.new("Frame")
        local Slider_ElementValue = Instance.new("TextLabel")
        local Slider_ElementOnInput = Instance.new("TextButton")
        local Slider_ElementName = Instance.new("TextLabel")
        local Slider_ElementLayout = Instance.new("UIListLayout")

        Slider_Element.Name = "Slider_Element"
        Slider_Element.Parent = WindowElements
        Slider_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_Element.BackgroundTransparency = 1.000
        Slider_Element.Size = UDim2.new(1, 0, 0, 23)

        Slider_ElementFrame.Name = "Slider_ElementFrame"
        Slider_ElementFrame.Parent = Slider_Element
        Slider_ElementFrame.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
        Slider_ElementFrame.BorderColor3 = Color3.fromRGB(74, 74, 83)
        Slider_ElementFrame.ClipsDescendants = true
        Slider_ElementFrame.Size = UDim2.new(0.300000012, 0, -3.34800005, 100)

        Slider_ElementSelector.Name = "Slider_ElementSelector"
        Slider_ElementSelector.Parent = Slider_ElementFrame
        Slider_ElementSelector.AnchorPoint = Vector2.new(0.5, 0.5)
        Slider_ElementSelector.BackgroundColor3 = Color3.fromRGB(70, 128, 209)
        Slider_ElementSelector.BackgroundTransparency = 0.150
        Slider_ElementSelector.BorderSizePixel = 0
        Slider_ElementSelector.Position = UDim2.new(0, 10, 0.5, 0)
        Slider_ElementSelector.Size = UDim2.new(0, 13, 0, 21)

        Slider_ElementValue.Name = "Slider_ElementValue"
        Slider_ElementValue.Parent = Slider_ElementFrame
        Slider_ElementValue.AnchorPoint = Vector2.new(0.5, 0.5)
        Slider_ElementValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementValue.BackgroundTransparency = 1.000
        Slider_ElementValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        Slider_ElementValue.Size = UDim2.new(1, 0, 1, 0)
        Slider_ElementValue.FontFace = GetFont()
        Slider_ElementValue.LineHeight = 0.930
        Slider_ElementValue.Text = SliderOptions.Default
        Slider_ElementValue.TextColor3 = Color3.fromRGB(217, 217, 217)
        Slider_ElementValue.TextSize = 17.000

        Slider_ElementOnInput.Name = "Slider_ElementOnInput"
        Slider_ElementOnInput.Parent = Slider_ElementFrame
        Slider_ElementOnInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementOnInput.BackgroundTransparency = 1.000
        Slider_ElementOnInput.Size = UDim2.new(1, 0, 1, 0)
        Slider_ElementOnInput.FontFace = GetFont()
        Slider_ElementOnInput.Text = ""
        Slider_ElementOnInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        Slider_ElementOnInput.TextSize = 14.000

        Slider_ElementName.Name = "Slider_ElementName"
        Slider_ElementName.Parent = Slider_Element
        Slider_ElementName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementName.BackgroundTransparency = 1.000
        Slider_ElementName.Position = UDim2.new(2.21000004, 0, 0, 0)
        Slider_ElementName.Size = UDim2.new(1, 0, 0.0299999993, 20)
        Slider_ElementName.FontFace = GetFont()
        Slider_ElementName.Text = SliderOptions.Name
        Slider_ElementName.TextColor3 = Color3.fromRGB(255, 255, 255)
        Slider_ElementName.TextSize = 17.000
        Slider_ElementName.TextXAlignment = Enum.TextXAlignment.Left

        Slider_ElementLayout.Name = "Slider_ElementLayout"
        Slider_ElementLayout.Parent = Slider_Element
        Slider_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
        Slider_ElementLayout.Padding = UDim.new(0, 7)

        local UserInputService = game:GetService("UserInputService")

        local minValue = SliderOptions.Min
        local maxValue = SliderOptions.Max
        local decimalPlaces = 0
        local defaultValue = SliderOptions.Default

        local function updateSlider(input)
            local sliderWidth = Slider_ElementOnInput.AbsoluteSize.X - 10
            local sliderPosition = math.clamp(input.Position.X - (Slider_ElementOnInput.AbsolutePosition.X + 5), 0, sliderWidth) / sliderWidth
            local sliderValue = minValue + (maxValue - minValue) * sliderPosition

            -- Check if the slider selector has reached the start of the slider
            if sliderPosition <= 0 then
                sliderPosition = 0
                sliderValue = minValue
                -- Check if the slider selector has reached the end of the slider
            elseif sliderPosition >= 1 then
                sliderPosition = 1
                sliderValue = maxValue
            else
                -- The slider is in the middle of the track, so update the slider value accordingly
                sliderValue = math.floor(minValue + (maxValue - minValue) * sliderPosition)
            end

            Slider_ElementValue.Text = string.format("%."..decimalPlaces.."f", sliderValue)
            Slider_ElementSelector.Position = UDim2.new(sliderPosition, 0, 0.5, 0)

            pcall(SliderOptions.OnChanged, sliderValue)
        end

        local function setSliderValue(value)
            value = math.clamp(value, minValue, maxValue)
            local sliderPosition = (value - minValue) / (maxValue - minValue)
            Slider_ElementValue.Text = string.format("%."..decimalPlaces.."f", value)
            Slider_ElementSelector.Position = UDim2.new(sliderPosition, 0, 0.5, 0)
        end

        setSliderValue(defaultValue)

        local dragging = false

        Slider_ElementOnInput.MouseButton1Down:Connect(function()
            dragging = true
        end)

        Slider_ElementOnInput.MouseButton1Up:Connect(function()
            dragging = false
        end)

        Slider_ElementFrame.MouseLeave:Connect(function() 
            dragging = false
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                updateSlider(input)
            end
        end)
    end

    function ElementHandler:CheckBox(CheckBoxOptions) 
        local CheckBox_Element = Instance.new("Frame")
        local CheckBox_ElementLayout = Instance.new("UIListLayout")
        local CheckBox_ElementBox = Instance.new("Frame")
        local CheckBox_ElementBoxInput = Instance.new("TextButton")
        local CheckBox_ElementImage = Instance.new("ImageLabel")
        local CheckBox_ElementName = Instance.new("TextLabel")

        local Enabled = CheckBoxOptions.Enabled

        CheckBox_Element.Name = "CheckBox_Element"
        CheckBox_Element.Parent = WindowElements
        CheckBox_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CheckBox_Element.BackgroundTransparency = 1.000
        CheckBox_Element.Size = UDim2.new(1, 0, 0, 23)
        
        CheckBox_ElementLayout.Name = "CheckBox_ElementLayout"
        CheckBox_ElementLayout.Parent = CheckBox_Element
        CheckBox_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
        CheckBox_ElementLayout.SortOrder = Enum.SortOrder.LayoutOrder
        CheckBox_ElementLayout.Padding = UDim.new(0, 10)
        
        CheckBox_ElementBox.Name = "CheckBox_ElementBox"
        CheckBox_ElementBox.Parent = CheckBox_Element
        CheckBox_ElementBox.BackgroundColor3 = Color3.fromRGB(36, 65, 106)
        CheckBox_ElementBox.BorderColor3 = Color3.fromRGB(74, 74, 83)
        CheckBox_ElementBox.Size = UDim2.new(0, 22, 0, 22)
        
        CheckBox_ElementBoxInput.Name = "CheckBox_ElementBoxInput"
        CheckBox_ElementBoxInput.Parent = CheckBox_ElementBox
        CheckBox_ElementBoxInput.AnchorPoint = Vector2.new(0.5, 0.5)
        CheckBox_ElementBoxInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CheckBox_ElementBoxInput.BackgroundTransparency = 1.000
        CheckBox_ElementBoxInput.Position = UDim2.new(0.5, 0, 0.5, 0)
        CheckBox_ElementBoxInput.Size = UDim2.new(1, 0, 1, 0)
        CheckBox_ElementBoxInput.FontFace = GetFont()
        CheckBox_ElementBoxInput.Text = ""
        CheckBox_ElementBoxInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        CheckBox_ElementBoxInput.TextSize = 14.000
        
        CheckBox_ElementImage.Name = "CheckBox_ElementImage"
        CheckBox_ElementImage.Parent = CheckBox_ElementBox
        CheckBox_ElementImage.AnchorPoint = Vector2.new(0.5, 0.5)
        CheckBox_ElementImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CheckBox_ElementImage.BackgroundTransparency = 1.000
        CheckBox_ElementImage.Position = UDim2.new(0.5, 0, 0.5, 0)
        CheckBox_ElementImage.Size = UDim2.new(0, 14, 0, 16)
        CheckBox_ElementImage.Image = "rbxassetid://13058405207"
        
        CheckBox_ElementName.Name = "CheckBox_ElementName"
        CheckBox_ElementName.Parent = CheckBox_Element
        CheckBox_ElementName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CheckBox_ElementName.BackgroundTransparency = 1.000
        CheckBox_ElementName.Size = UDim2.new(1, 0, 0, 20)
        CheckBox_ElementName.FontFace = GetFont()
        CheckBox_ElementName.Text = CheckBoxOptions.Name
        CheckBox_ElementName.TextColor3 = Color3.fromRGB(255, 255, 255)
        CheckBox_ElementName.TextSize = 17.000
        CheckBox_ElementName.TextXAlignment = Enum.TextXAlignment.Left
                
        if Enabled then
            CheckBox_ElementImage.Visible = true
        else
            CheckBox_ElementImage.Visible = false
        end

        CheckBox_ElementBoxInput.MouseButton1Click:Connect(function()
            Enabled = not Enabled

            if Enabled then
                CheckBox_ElementImage.Visible = true
            else
                CheckBox_ElementImage.Visible = false
            end

            pcall(CheckBoxOptions.OnChanged, Enabled)
        end)
    end
    
    function ElementHandler:Seperator() 
        local Seperator_Element = Instance.new("Frame")
        
        Seperator_Element.Name = "Seperator_Element"
        Seperator_Element.Parent = WindowElements
        Seperator_Element.BackgroundColor3 = Color3.fromRGB(74, 74, 83)
        Seperator_Element.BorderColor3 = Color3.fromRGB(27, 42, 53)
        Seperator_Element.BorderSizePixel = 0
        Seperator_Element.Size = UDim2.new(1, 0, 0, 1)
    end

    function ElementHandler:ColorPicker3(ColorPickerArgs) 
        local Color_Element = Instance.new("Frame")
        local Color_ElementLayout = Instance.new("UIListLayout")
        local Color_ElementRed = Instance.new("Frame")
        local Color_ElementRedTextInput = Instance.new("TextBox")
        local Color_ElementRedButtonInput = Instance.new("TextButton")
        local Color_ElementGreen = Instance.new("Frame")
        local Color_ElementGreenTextInput = Instance.new("TextBox")
        local Color_ElementGreenButtonInput = Instance.new("TextButton")
        local Color_ElementBlue = Instance.new("Frame")
        local Color_ElementBlueTextInput = Instance.new("TextBox")
        local Color_ElementBlueButtonInput = Instance.new("TextButton")
        local Color_ElementDisplay = Instance.new("Frame")
        local Color_ElementName = Instance.new("TextLabel")

        local ColorPickerName = ColorPickerArgs.Name

        Color_Element.Name = "Color_Element"
        Color_Element.Parent = WindowElements
        Color_Element.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_Element.BackgroundTransparency = 1.000
        Color_Element.Position = UDim2.new(0, 0, 0.49666667, 0)
        Color_Element.Size = UDim2.new(1, 0, 0, 23)

        Color_ElementLayout.Name = "Color_ElementLayout"
        Color_ElementLayout.Parent = Color_Element
        Color_ElementLayout.FillDirection = Enum.FillDirection.Horizontal
        Color_ElementLayout.SortOrder = Enum.SortOrder.LayoutOrder
        Color_ElementLayout.Padding = UDim.new(0, 7)

        Color_ElementRed.Name = "Color_ElementRed"
        Color_ElementRed.Parent = Color_Element
        Color_ElementRed.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
        Color_ElementRed.BorderColor3 = Color3.fromRGB(74, 74, 83)
        Color_ElementRed.Size = UDim2.new(0, 60, 1, 0)

        Color_ElementRedTextInput.Name = "Color_ElementRedTextInput"
        Color_ElementRedTextInput.Parent = Color_ElementRed
        Color_ElementRedTextInput.AnchorPoint = Vector2.new(0.5, 0.5)
        Color_ElementRedTextInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementRedTextInput.BackgroundTransparency = 1.000
        Color_ElementRedTextInput.Position = UDim2.new(0.5, 0, 0.5, 0)
        Color_ElementRedTextInput.Size = UDim2.new(0, 25, 1, 0)
        Color_ElementRedTextInput.FontFace = GetFont()
        Color_ElementRedTextInput.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementRedTextInput.PlaceholderText = "R:255"
        Color_ElementRedTextInput.Text = "R:255"
        Color_ElementRedTextInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementRedTextInput.TextSize = 17.000

        Color_ElementRedButtonInput.Name = "Color_ElementRedButtonInput"
        Color_ElementRedButtonInput.Parent = Color_ElementRed
        Color_ElementRedButtonInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementRedButtonInput.BackgroundTransparency = 1.000
        Color_ElementRedButtonInput.Size = UDim2.new(1, 0, 1, 0)
        Color_ElementRedButtonInput.FontFace = GetFont()
        Color_ElementRedButtonInput.Text = ""
        Color_ElementRedButtonInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        Color_ElementRedButtonInput.TextSize = 14.000

        Color_ElementGreen.Name = "Color_ElementGreen"
        Color_ElementGreen.Parent = Color_Element
        Color_ElementGreen.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
        Color_ElementGreen.BorderColor3 = Color3.fromRGB(74, 74, 83)
        Color_ElementGreen.Size = UDim2.new(0, 60, 1, 0)

        Color_ElementGreenTextInput.Name = "Color_ElementGreenTextInput"
        Color_ElementGreenTextInput.Parent = Color_ElementGreen
        Color_ElementGreenTextInput.AnchorPoint = Vector2.new(0.5, 0.5)
        Color_ElementGreenTextInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementGreenTextInput.BackgroundTransparency = 1.000
        Color_ElementGreenTextInput.Position = UDim2.new(0.5, 0, 0.5, 0)
        Color_ElementGreenTextInput.Size = UDim2.new(0, 25, 1, 0)
        Color_ElementGreenTextInput.FontFace = GetFont()
        Color_ElementGreenTextInput.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementGreenTextInput.PlaceholderText = "G:255"
        Color_ElementGreenTextInput.Text = "G:255"
        Color_ElementGreenTextInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementGreenTextInput.TextSize = 17.000

        Color_ElementGreenButtonInput.Name = "Color_ElementGreenButtonInput"
        Color_ElementGreenButtonInput.Parent = Color_ElementGreen
        Color_ElementGreenButtonInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementGreenButtonInput.BackgroundTransparency = 1.000
        Color_ElementGreenButtonInput.Size = UDim2.new(1, 0, 1, 0)
        Color_ElementGreenButtonInput.FontFace = GetFont()
        Color_ElementGreenButtonInput.Text = ""
        Color_ElementGreenButtonInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        Color_ElementGreenButtonInput.TextSize = 14.000

        Color_ElementBlue.Name = "Color_ElementBlue"
        Color_ElementBlue.Parent = Color_Element
        Color_ElementBlue.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
        Color_ElementBlue.BorderColor3 = Color3.fromRGB(74, 74, 83)
        Color_ElementBlue.Size = UDim2.new(0, 60, 1, 0)

        Color_ElementBlueTextInput.Name = "Color_ElementBlueTextInput"
        Color_ElementBlueTextInput.Parent = Color_ElementBlue
        Color_ElementBlueTextInput.AnchorPoint = Vector2.new(0.5, 0.5)
        Color_ElementBlueTextInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementBlueTextInput.BackgroundTransparency = 1.000
        Color_ElementBlueTextInput.Position = UDim2.new(0.5, 0, 0.5, 0)
        Color_ElementBlueTextInput.Size = UDim2.new(0, 25, 1, 0)
        Color_ElementBlueTextInput.FontFace = GetFont()
        Color_ElementBlueTextInput.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementBlueTextInput.PlaceholderText = "B:255"
        Color_ElementBlueTextInput.Text = "B:255"
        Color_ElementBlueTextInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementBlueTextInput.TextSize = 17.000

        Color_ElementBlueButtonInput.Name = "Color_ElementBlueButtonInput"
        Color_ElementBlueButtonInput.Parent = Color_ElementBlue
        Color_ElementBlueButtonInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementBlueButtonInput.BackgroundTransparency = 1.000
        Color_ElementBlueButtonInput.Size = UDim2.new(1, 0, 1, 0)
        Color_ElementBlueButtonInput.FontFace = GetFont()
        Color_ElementBlueButtonInput.Text = ""
        Color_ElementBlueButtonInput.TextColor3 = Color3.fromRGB(0, 0, 0)
        Color_ElementBlueButtonInput.TextSize = 14.000

        Color_ElementDisplay.Name = "Color_ElementDisplay"
        Color_ElementDisplay.Parent = Color_Element
        Color_ElementDisplay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementDisplay.BorderColor3 = Color3.fromRGB(74, 74, 83)
        Color_ElementDisplay.Size = UDim2.new(0, 23, 0, 23)

        Color_ElementName.Name = "Color_ElementName"
        Color_ElementName.Parent = Color_Element
        Color_ElementName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementName.BackgroundTransparency = 1.000
        Color_ElementName.Position = UDim2.new(2.21000075, 0, 0, 0)
        Color_ElementName.Size = UDim2.new(1, 0, 0, 23)
        Color_ElementName.FontFace = GetFont()
        Color_ElementName.Text = ColorPickerName
        Color_ElementName.TextColor3 = Color3.fromRGB(255, 255, 255)
        Color_ElementName.TextSize = 17.000
        Color_ElementName.TextXAlignment = Enum.TextXAlignment.Left

        local UIS = game:GetService("UserInputService")
        local CurrentColor = ColorPickerArgs.DefaultColor or Color3.fromRGB(255, 255, 255)

        local R, G, B = CurrentColor.R, CurrentColor.G, CurrentColor.B;

        local function setColor()
            Color_ElementDisplay.BackgroundColor3 = CurrentColor
            pcall(ColorPickerArgs.OnChanged, CurrentColor)
        end

        local function updateColor()
            CurrentColor = Color3.fromRGB(R, G, B)

            setColor()
        end

        Color_ElementRedTextInput.Text = string.format("R:%s", CurrentColor.R);
        Color_ElementGreenTextInput.Text = string.format("G:%s", CurrentColor.G);
        Color_ElementBlueTextInput.Text = string.format("B:%s", CurrentColor.B);

        setColor()

        for _, colorButton in pairs(Color_Element:GetDescendants()) do
            if colorButton:IsA("TextButton") then
                colorButton.MouseButton1Down:Connect(function()
                    while UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        local x = math.clamp(UIS:GetMouseLocation().X - colorButton.AbsolutePosition.X, 0, colorButton.AbsoluteSize.X)
                        local value = math.floor(x / colorButton.AbsoluteSize.X * 255 + 0.5)
                        local color = string.sub(colorButton.Name, 14, 14)

                        if color == "R" then
                            R = value
                            Color_ElementRedTextInput.Text = string.format("R:%s", value);
                            updateColor()
                        elseif color == "G" then
                            G = value
                            Color_ElementGreenTextInput.Text = string.format("G:%s", value);
                            updateColor()
                        elseif color == "B" then
                            B = value
                            Color_ElementBlueTextInput.Text = string.format("B:%s", value);
                            updateColor()
                        end

                        task.wait()
                    end
                end)
            end
        end


    end

    -- Handle the resize feature
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    
    local selected = false
    local window = Window
    local corner = ResizeAll
    local debounce = false
    
    -- update initial position of the corner
    local function updateInitialPosition()
        local initialPosition = UDim2.new(1, -(corner.AbsoluteSize.X - 10), 1, -(corner.AbsoluteSize.Y - 10) + 0.1)
        local tweenInfo = TweenInfo.new(0.01, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        local initTween = TweenService:Create(corner, tweenInfo, {
            Position = initialPosition
        })
        initTween:Play()
    end
    updateInitialPosition()
    
    local function ResizeWindow()
        if debounce then
            return
        end
        debounce = true
    
        local mousePos = UserInputService:GetMouseLocation()
        local windowLeft = window.AbsolutePosition.X
        local windowTop = window.AbsolutePosition.Y
        local cornerWidth = corner.AbsoluteSize.X
        local cornerHeight = corner.AbsoluteSize.Y
    
        -- calculate new size
        local newWidth = math.max((mousePos.X - windowLeft + (cornerWidth / 2)), 35)
        local newHeight = math.max(((mousePos.Y - windowTop + (cornerHeight / 2)) - 35), 35)
    
        -- update window size
        local tweenInfo = TweenInfo.new(0.01, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        local resizeTween = TweenService:Create(window, tweenInfo, {
            Size = UDim2.new(0, newWidth, 0, newHeight)
        })
        resizeTween:Play()
        
        updateInitialPosition()
    
        debounce = false
    end
    
    corner.MouseButton1Down:Connect(function()
        selected = true
        ResizeWindow()
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if selected and input.UserInputType == Enum.UserInputType.MouseMovement then
            ResizeWindow()
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            selected = false
        end
    end)
    
    -- update corner position when window is resized
    window:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        updateInitialPosition()
    end)

    
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    
    -- Get objects
    local window = Window
    local topPanel = WindowPanel
    
    -- Variables
    local dragging = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil
    
    -- Functions
    local function updateDrag(input)
        local delta = input.Position - dragStart
        local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    
        -- Tween to new position
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(window, tweenInfo, { Position = newPosition })
        tween:Play()
    end
    
    -- Events
    topPanel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = window.Position
    
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    topPanel.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateDrag(input)
        end
    end)

    local showing = true
    MinimiseButton.MouseButton1Click:Connect(function() 
        showing = not showing
        
        if not showing then
            WindowElementContainer.Visible = false
            WindowPanelIcon.ImageTransparency = 0.3
            Window.BackgroundTransparency = 1
            ResizeAll.Visible = false
        else
            WindowElementContainer.Visible = true
            WindowPanelIcon.ImageTransparency = 0
            Window.BackgroundTransparency = 0.05
            ResizeAll.Visible = true
        end
        
    end)
    
    function ElementHandler:End()
        local showing = true
        MinimiseButton.MouseButton1Click:Connect(function() 
            showing = not showing
            
            if not showing then
                WindowElementContainer.Visible = false
                WindowPanelIcon.ImageTransparency = 0.3
                Window.BackgroundTransparency = 1
                ResizeAll.Visible = false
                MinimiseButtonIcon.Rotation = 180
            else
                WindowElementContainer.Visible = true
                WindowPanelIcon.ImageTransparency = 0
                Window.BackgroundTransparency = 0.05
                ResizeAll.Visible = true
                MinimiseButtonIcon.Rotation = 0
            end
            
        end)

        Window:GetPropertyChangedSignal("Size"):Connect(function()
            local children = WindowElements:GetChildren()
            WindowElements.ScrollingEnabled = true
    
            WindowElements.CanvasSize = UDim2.new(0, 0, 0, 0)
            
            -- Calculate the total height of the children
            local totalHeight = 0
            for _, child in ipairs(children) do
                if child:IsA("GuiObject") then
                    totalHeight = (totalHeight + child.Size.Y.Offset) + 5
                end
            end
            
            -- Check if the total height of the children is greater than the height of the ScrollableFrame
            if totalHeight > WindowElements.AbsoluteSize.Y then
                -- Set the CanvasSize of the ScrollableFrame to fit all the children
                local padding = 0
                padding = WindowElementsContainerLayout.Padding.Offset
                WindowElements.CanvasSize = UDim2.new(0, 0, 0, totalHeight + padding)
            end
        end)

        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode.Name == "RightBracket" then
                ImGui:Destroy()
            end
        end)
    end

    return ElementHandler
end

return main

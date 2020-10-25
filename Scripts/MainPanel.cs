using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MainPanel : MonoBehaviour
{
    public Button startBtn;//Start button

    public Button muteBtn;//Mute button

    public Button unmuteBtn;//Turn on sound button

    // Start is called before the first frame update
    void Start()
    {
        startBtn.onClick.AddListener(() =>
        {
            UIManager.Instance.OpenSelectMenuPanel();//Open the menu selection panel
        });

        muteBtn.onClick.AddListener(() => { AudioManager.Instance.AudioSourceBg.mute = true; });//Open music

        unmuteBtn.onClick.AddListener(() => { AudioManager.Instance.AudioSourceBg.mute = false; });//Music off
    }

    // Update is called once per frame
    void Update()
    {
    }
}
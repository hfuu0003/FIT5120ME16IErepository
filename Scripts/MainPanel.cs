using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MainPanel : MonoBehaviour
{
    public Button startBtn;

    public Button muteBtn;

    public Button unmuteBtn;

    // Start is called before the first frame update
    void Start()
    {
        startBtn.onClick.AddListener(() =>
        {
            UIManager.Instance.OpenSelectMenuPanel();
        });

        muteBtn.onClick.AddListener(() => { AudioManager.Instance.AudioSourceBg.mute = true; });

        unmuteBtn.onClick.AddListener(() => { AudioManager.Instance.AudioSourceBg.mute = false; });
    }

    // Update is called once per frame
    void Update()
    {
    }
}
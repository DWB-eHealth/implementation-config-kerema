            SELECT concept_id INTO @numeric1_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 250Hz';
            SELECT concept_id INTO @numeric2_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 500Hz';
            SELECT concept_id INTO @numeric3_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 1000Hz';
            SELECT concept_id INTO @numeric4_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 2000Hz';
            SELECT concept_id INTO @numeric5_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 4000Hz';
            SELECT concept_id INTO @numeric6_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 6000Hz';
            SELECT concept_id INTO @numeric7_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 8000Hz';

            SELECT concept_id INTO @numeric8_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 250Hz';
            SELECT concept_id INTO @numeric9_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 500Hz';
            SELECT concept_id INTO @numeric10_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 1000Hz';
            SELECT concept_id INTO @numeric11_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 2000Hz';
            SELECT concept_id INTO @numeric12_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 4000Hz';
            SELECT concept_id INTO @numeric13_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 6000Hz';
            SELECT concept_id INTO @numeric14_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 8000Hz';

            SELECT concept_id INTO @child1_concept_id FROM concept_name WHERE name = 'Audiometry, 0 to 20 db';
            SELECT concept_id INTO @child2_concept_id FROM concept_name WHERE name = 'Audiometry, 21 to 40 dB';
            SELECT concept_id INTO @child3_concept_id FROM concept_name WHERE name = 'Audiometry, 41 to 55 dB';
            SELECT concept_id INTO @child4_concept_id FROM concept_name WHERE name = 'Audiometry, 56 to 70 dB';
            SELECT concept_id INTO @child5_concept_id FROM concept_name WHERE name = 'Audiometry, 71 to 90 dB';
            SELECT concept_id INTO @child6_concept_id FROM concept_name WHERE name = 'Audiometry, 91+ dB';

            SELECT concept_id INTO @coded1_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 250Hz-Coded_old';
            SELECT concept_id INTO @coded2_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 500Hz-Coded_old';
            SELECT concept_id INTO @coded3_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 1000Hz-Coded_old';
            SELECT concept_id INTO @coded4_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 2000Hz-Coded_old';
            SELECT concept_id INTO @coded5_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 4000Hz-Coded_old';
            SELECT concept_id INTO @coded6_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 6000Hz-Coded_old';
            SELECT concept_id INTO @coded7_concept_id FROM concept_name WHERE name = 'Audiometry, Left ear at 8000Hz-Coded_old';

            SELECT concept_id INTO @coded8_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 250Hz-Coded_old';
            SELECT concept_id INTO @coded9_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 500Hz-Coded_old';
            SELECT concept_id INTO @coded10_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 1000Hz-Coded_old';
            SELECT concept_id INTO @coded11_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 2000Hz-Coded_old';
            SELECT concept_id INTO @coded12_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 4000Hz-Coded_old';
            SELECT concept_id INTO @coded13_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 6000Hz-Coded_old';
            SELECT concept_id INTO @coded14_concept_id FROM concept_name WHERE name = 'Audiometry, Right ear at 8000Hz-Coded_old';

            UPDATE obs SET concept_id =
            IF((concept_id = @coded1_concept_id), @numeric1_concept_id,
            IF((concept_id = @coded2_concept_id), @numeric2_concept_id,
            IF((concept_id = @coded3_concept_id), @numeric3_concept_id,
            IF((concept_id = @coded4_concept_id), @numeric4_concept_id,
            IF((concept_id = @coded5_concept_id), @numeric5_concept_id,
            IF((concept_id = @coded6_concept_id), @numeric6_concept_id,
            IF((concept_id = @coded7_concept_id), @numeric7_concept_id,
            IF((concept_id = @coded8_concept_id), @numeric8_concept_id,
            IF((concept_id = @coded9_concept_id), @numeric9_concept_id,
            IF((concept_id = @coded10_concept_id), @numeric10_concept_id,
            IF((concept_id = @coded11_concept_id), @numeric11_concept_id,
            IF((concept_id = @coded12_concept_id), @numeric12_concept_id,
            IF((concept_id = @coded13_concept_id), @numeric13_concept_id,
            IF((concept_id = @coded14_concept_id), @numeric14_concept_id,
            concept_id))))))))))))));

            UPDATE obs set value_numeric =
            IF((value_coded = @child1_concept_id), 10,
            IF((value_coded = @child2_concept_id), 30,
            IF((value_coded = @child3_concept_id), 48,
            IF((value_coded = @child4_concept_id), 63,
            IF((value_coded = @child5_concept_id), 80,
            IF((value_coded = @child6_concept_id), 100,
            0)))))),
            value_coded = NULL
            WHERE concept_id in (@numeric1_concept_id,@numeric2_concept_id,@numeric3_concept_id,@numeric4_concept_id,@numeric5_concept_id,@numeric6_concept_id,@numeric7_concept_id,@numeric8_concept_id,@numeric9_concept_id,@numeric10_concept_id,@numeric11_concept_id,@numeric12_concept_id,@numeric13_concept_id,@numeric14_concept_id);
       

